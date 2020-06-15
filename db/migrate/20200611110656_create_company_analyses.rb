class CreateCompanyAnalyses < ActiveRecord::Migration[5.2]
  def change
    create_table :company_analyses do |t|

      t.integer "company_id", null:false
      t.integer "company_question_id", null:false
      t.text "answer", null:false

      t.timestamps
    end
  end
end
