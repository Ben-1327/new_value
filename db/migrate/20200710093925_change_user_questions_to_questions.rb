class ChangeUserQuestionsToQuestions < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_questions, :questions
  end
end
