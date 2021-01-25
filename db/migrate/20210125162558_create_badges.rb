class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.references :user, foreign_key: true
      t.references :achivment, foreign_key: true
      t.timestamps
    end
  end
end
