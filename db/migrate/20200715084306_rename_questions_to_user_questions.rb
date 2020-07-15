class RenameQuestionsToUserQuestions < ActiveRecord::Migration[5.2]
  def change
    rename_table :questions, :user_questions
  end
end
