class AnalysisPart < ApplicationRecord

  has_many :user_questions, dependent: :destroy

end
