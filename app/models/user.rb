class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :self_analyses,dependent: :destroy

  # relationshipsによるフォローではなくGemを使ったフォローに変更しました

  # has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id"
  # has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id"
  # has_many :following_user, through: :active_relationships, source: :followed
  # has_many :follower_user, through: :passive_relationships, source: :follower

  acts_as_followable # フォロワー機能
  acts_as_follower   # フォロー機能

  def follow
    @user = User.find(params[:id])
    # ログイン中のユーザーが対象のユーザー(@user)をフォローする
    current_user.follow(@user)
  end

  def unfollow
    @user = User.find(params[:id])
    # ログイン中のユーザーが対象のユーザー(@user)のフォローを外す
    current_user.stop_following(@user)
  end

  def following?
    @user = User.find(params[:id])
    # ログイン中のユーザーが対象のユーザー(@user)をフォローしているか確認する
    current_user.following?(@user)
  end

end
