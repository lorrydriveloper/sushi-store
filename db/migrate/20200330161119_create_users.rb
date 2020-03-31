# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :address
      t.string :avatar
      t.boolean :admin, default: false
      # Ex:- :default =>''

      t.timestamps
    end
  end
end
