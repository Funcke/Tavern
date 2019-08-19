# frozen_string_literal: true

# Migration for creating Allergenics model
class CreateAllergenics < ActiveRecord::Migration[5.2]
  def change
    create_table :allergenics do |t|
      t.string :name
      t.string :token

      t.timestamps
    end
  end
end
