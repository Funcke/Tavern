# frozen_string_literal: true

# Migration creating Users model
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.string :email
      t.string :password_digest

      t.belongs_to :organization
      t.belongs_to :role
      
      t.timestamps
    end
  end
end
