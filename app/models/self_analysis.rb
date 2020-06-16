class SelfAnalysis < ApplicationRecord

  has_many :self_analysis_comments,dependent: :destroy
  has_many :favorites,dependent: :destroy

  belongs_to :user
  belongs_to :user_question

  def favorited_by?
    favorites.where(user_id: user.id).exists?
  end

end
