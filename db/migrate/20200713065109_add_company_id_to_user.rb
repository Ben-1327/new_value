class AddCompanyIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :company_id, :integer
    remove_column :users, :hp
  end
end
