class CreateCompanyAnalyses < ActiveRecord::Migration[5.2]
  def change
    create_table :company_analyses do |t|

      t.string "question", null:false
      t.text "answer"

      t.timestamps
    end
  end
end
