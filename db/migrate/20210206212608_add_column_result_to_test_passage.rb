class AddColumnResultToTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :result, :boolean, default: false, index: true
  end
end
