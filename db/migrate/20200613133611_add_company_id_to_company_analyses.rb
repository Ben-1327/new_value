class AddCompanyIdToCompanyAnalyses < ActiveRecord::Migration[5.2]
  def change
    add_column :company_analyses, :company_id, :integer
  end
end
