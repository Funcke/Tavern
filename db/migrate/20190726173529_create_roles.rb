# frozen_string_literal: true

# Migration for creating roles table
class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name
      t.belongs_to :organization
      t.belongs_to :level
      t.timestamps
    end
  end
end
