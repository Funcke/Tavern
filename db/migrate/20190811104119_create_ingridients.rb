# frozen_string_literal: true

# Migration for creating Ingridients model
class CreateIngridients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingridients do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
