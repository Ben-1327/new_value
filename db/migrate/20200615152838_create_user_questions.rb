class CreateUserQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_questions do |t|

      t.integer "analysis_part_id", null: false
      t.integer "step", null: false, default: 1
      t.string "question", null: false

      t.timestamps
    end
  end
end
