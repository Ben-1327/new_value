class CompanyQuestion < ApplicationRecord

  has_many :company_analyses,dependent: :destroy

end
