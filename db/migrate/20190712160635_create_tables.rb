# frozen_string_literal: true

# Migration creating Tables model
class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.integer :number
      t.integer :seats
      t.string :description

      t.belongs_to :organization
      t.timestamps
    end
  end
end
