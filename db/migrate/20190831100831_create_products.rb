# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
    def change
      create_table :products do |t|
        t.decimal :price
        t.string :name
        t.string :description
        t.string :type
        t.integer :quantity
        t.string :quantity_type
        t.belongs_to :organization
        t.belongs_to :category
        t.timestamps
      end

      create_table 'menu_items' do |t|
        t.integer 'menu_id', :null => false
        t.integer 'product_id', :null => false
      end
    end
end
  