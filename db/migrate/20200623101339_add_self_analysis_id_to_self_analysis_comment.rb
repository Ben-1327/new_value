class AddSelfAnalysisIdToSelfAnalysisComment < ActiveRecord::Migration[5.2]
  def change
    add_column :self_analysis_comments, :self_analysis_id, :integer
    add_column :self_analysis_comments, :user_id, :integer
  end
end
