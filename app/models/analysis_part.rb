class AnalysisPart < ApplicationRecord

  has_many :self_analyses, dependent: :destroy

end
