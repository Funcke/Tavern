# frozen_string_literal: true

class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.integer :nummer
      t.belongs_to :organization
      t.timestamps
    end
  end
end
