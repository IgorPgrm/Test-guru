class AddNewReferenceForQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :questions, :tests
    add_reference :questions, :test
  end
end
