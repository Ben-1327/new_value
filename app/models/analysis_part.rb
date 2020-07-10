class AnalysisPart < ApplicationRecord

  has_many :questions, dependent: :destroy

end
