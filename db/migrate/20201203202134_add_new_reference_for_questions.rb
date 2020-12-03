class AddNewReferenceForQuestions < ActiveRecord::Migration[6.0]
  def up
    remove_column :questions, :tests_id
    add_reference :questions, :test, foreign_key: true
  end

  def down
    remove_column :questions, :test_id
    add_reference :questions, :tests
  end
end
