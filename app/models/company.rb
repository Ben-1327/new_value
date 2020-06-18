class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :company_analyses, dependent: :destroy

  acts_as_followable # フォロワー機能
  acts_as_follower   # フォロー機能

  
end
