# frozen_string_literal: true

# Migration for joined relationship between products and allergenes
class CreateJoinTableProductAllergenic < ActiveRecord::Migration[5.2]
  def change
    create_join_table :dish, :allergenics do |t|
      t.index %i[product_id allergenic_id], name: 'allergene_dish'
      t.index %i[allergenic_id product_id], name: 'dish_allergene'
    end

    add_foreign_key :dish_allergenic, :products
    add_foreign_key :dish_allergenic, :allergenics
  end
end
