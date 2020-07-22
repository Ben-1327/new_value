class AddRepresentativeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :representative, :boolean, default: false
  end
end
