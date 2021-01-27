class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.text :name, index: true
      t.text :file_name, unique: true
      t.text :identity
      t.timestamps null: false
    end
  end
end
