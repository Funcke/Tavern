# frozen_string_literal: true

# Migration for creating OrderGroups model
class CreateOrderGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :order_groups do |t|
      t.string :number
      t.belongs_to :organization
      t.timestamps
    end
  end
end
