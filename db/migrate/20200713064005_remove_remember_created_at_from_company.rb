class RemoveRememberCreatedAtFromCompany < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :remember_created_at, :datetime
  end
end
