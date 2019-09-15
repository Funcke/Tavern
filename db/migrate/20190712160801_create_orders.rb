# frozen_string_literal: true

# Migratino for creating orders table
class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.boolean :paid
      t.belongs_to :dish
      t.belongs_to :drink
      t.belongs_to :order_sessions
      t.belongs_to :organization
      
      t.timestamps
    end
  end
end
