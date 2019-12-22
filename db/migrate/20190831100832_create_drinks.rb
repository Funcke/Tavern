# frozen_string_literal: true

class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.decimal :price
      t.string :name
      t.integer :quantity
      t.string :quantity_type

      t.belongs_to :organization
      t.belongs_to :category
      t.timestamps
    end
  end
end
