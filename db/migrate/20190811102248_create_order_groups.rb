# frozen_string_literal: true

# Migration for creating OrderGroups model
class CreateOrderGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :order_groups do |t|
      t.belongs_to :organization
      t.belongs_to :table
      t.boolean :open

      t.timestamps
    end
  end
end
