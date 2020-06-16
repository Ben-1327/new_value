class SelfAnalysis < ApplicationRecord

  has_many :self_analysis_comments,dependent: :destroy

  belongs_to :user
  belongs_to :user_question

end
