class CreateSelfAnalyses < ActiveRecord::Migration[5.2]
  def change
    create_table :self_analyses do |t|

      t.integer "step",null: false, default: 0
      t.string "question",null: false
      t.text "answer"
      t.text "analysis"
      t.integer "range",null: false,default: 0

      t.timestamps
    end
  end
end
