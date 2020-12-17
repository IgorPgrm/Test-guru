class CreateTestPassages < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passages do |t|
      t.references :user
      t.references :test
      t.references :current_question
      t.integer :correct_questions, default: 0

      t.timestamps
    end
    add_index :test_passages, :users
    add_index :test_passages, :tests
    add_index :test_passages, :current_questions
  end
end
