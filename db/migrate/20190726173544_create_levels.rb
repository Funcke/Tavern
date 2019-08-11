# frozen_string_literal: true

# Migration for creating Levels table
class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.string :name
      t.timestamps
    end
  end
end
