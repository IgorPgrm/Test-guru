class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.text :title, null: false
      t.integer :level, null: false, default: 0
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
