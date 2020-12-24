class AddDefaultToUsers < ActiveRecord::Migration[6.0]
  def up
    change_column_default :users, :first_name, ''
    change_column_default :users, :last_name, ''
  end

  def down
    change_column_default :users, :first_name, nil
    change_column_default :users, :last_name, nil
  end
end
