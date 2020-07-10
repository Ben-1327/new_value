class Question < ApplicationRecord

  has_many :self_analyses,dependent: :destroy

  belongs_to :analysis_part

end
