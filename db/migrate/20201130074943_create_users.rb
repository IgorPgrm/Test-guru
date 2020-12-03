# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :first_name, null: false
      t.text :last_name, null: false
      t.text :email, null: false

      t.timestamps
    end
  end
end
