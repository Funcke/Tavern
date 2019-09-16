# frozen_string_literal: true

# Migration for joined table between ingridients and allergenics
class CreateJoinTableIngridientAllergenic < ActiveRecord::Migration[5.2]
  def change
    create_join_table :ingridients, :allergenics do |t|
      t.index %i[ingridient_id allergenic_id], name: 'ingridient_allergenic'
      t.index %i[allergenic_id ingridient_id], name: 'allergenic_ingridient'
    end
    add_foreign_key :allergenics_ingridients, :ingridients
    add_foreign_key :allergenics_ingridients, :allergenics
  end
end
