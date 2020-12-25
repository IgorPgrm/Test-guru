class AddTypeAttributeToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :type, :string, null: false, default: 'User'
    add_index :users, :type
  end

  def down
    remove_column :users, :type
  end
end
