# frozen_string_literal: true

# Migration for joined relationship between products and allergenes
class CreateJoinTableProductAllergenic < ActiveRecord::Migration[5.2]
  def change
    create_join_table :dish, :allergenics do |t|
      t.index %i[dish_id allergenic_id], name: 'allergene_dish'
      t.index %i[allergenic_id dish_id], name: 'dish_allergene'
    end

    add_foreign_key :allergenics_dish, :dishes
    add_foreign_key :allergenics_dish, :allergenics
  end
end
