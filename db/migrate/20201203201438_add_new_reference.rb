class AddNewReference < ActiveRecord::Migration[6.0]
  def up
    remove_column :answers, :questions_id
    add_reference :answers, :question, foreign_key: true
  end

  def down
    remove_column :answers, :question_id
    add_reference :answers, :questions
  end
end
