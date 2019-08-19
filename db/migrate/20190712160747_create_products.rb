# frozen_string_literal: true

# Migration creating Products Model
class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.float :price
      t.string :name
      t.boolean :food
      t.boolean :drink
      t.belongs_to :organization
      t.timestamps
    end
  end
end
