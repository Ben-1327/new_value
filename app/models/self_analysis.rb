class SelfAnalysis < ApplicationRecord

  has_many :self_analysis_comments,dependent: :destroy
  has_many :favorites,dependent: :destroy

  belongs_to :user
  belongs_to :question

  validates :answer, presence: true
  validates :range, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
