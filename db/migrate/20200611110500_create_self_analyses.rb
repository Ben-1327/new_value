class CreateSelfAnalyses < ActiveRecord::Migration[5.2]
  def change
    create_table :self_analyses do |t|

      t.integer "user_id",null: false
      t.integer "user_question_id",null: false
      t.text "answer", null: false
      t.text "analysis"
      t.integer "range",null: false,default: 1

      t.timestamps
    end
  end
end
