# frozen_string_literal: true

# Migration for joined relationship between products and allergenes
class CreateJoinTableProductAllergenic < ActiveRecord::Migration[5.2]
  def change
    create_join_table :procuts, :allergenics do |t|
      t.index %i[product_id allergenic_id], name: 'allergene_product'
      t.index %i[allergenic_id product_id], name: 'product_allergene'
    end

    add_foreign_key :allergenics_product, :products
    add_foreign_key :allergenics_product, :allergenics
  end
end
