class AddHpToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hp, :string
    add_column :users, :type, :integer, default: 0, null: false
  end
end
