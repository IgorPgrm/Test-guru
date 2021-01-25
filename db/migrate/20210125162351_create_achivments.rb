class CreateAchivments < ActiveRecord::Migration[6.0]
  def change
    create_table :achivments do |t|
      t.text :name, index: true
      t.text :text, unique: true
      t.timestamps null: false
    end
  end
end
