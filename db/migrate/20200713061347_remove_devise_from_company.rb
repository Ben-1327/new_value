class RemoveDeviseFromCompany < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :email
    remove_column :companies, :encrypted_password
    remove_column :companies, :reset_password_token
    remove_column :companies, :reset_password_sent_at
    remove_column :companies, :HP
    remove_column :companies, :header_img
    add_column :companies, :hp, :string
  end
end
