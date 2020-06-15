class CreateSelfAnalysisComments < ActiveRecord::Migration[5.2]
  def change
    create_table :self_analysis_comments do |t|

      t.text "comment", null: false

      t.timestamps
    end
  end
end
