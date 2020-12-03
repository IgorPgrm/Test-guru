class AddNewReference < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :answers, :questions
    add_reference :answers, :question
  end
end
