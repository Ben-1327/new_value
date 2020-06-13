class AddColumnSelfAnalyses < ActiveRecord::Migration[5.2]
  def change
    add_column :self_analyses, :user_id, :integer
    add_column :self_analyses, :analysis_part_id, :integer
  end
end
