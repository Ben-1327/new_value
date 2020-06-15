class CreateCompanyQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :company_questions do |t|

      t.string "question", null: false

      t.timestamps
    end
  end
end
