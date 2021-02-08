class AddColumnResultToTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_reference :test_passages, :badge, foreign_key: true
    add_column :test_passages, :result, :boolean, default: false, index: true
  end
end
