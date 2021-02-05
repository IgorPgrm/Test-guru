class AddBadgeIdToTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_reference :test_passages, :badge, foreign_key: true
  end
end
