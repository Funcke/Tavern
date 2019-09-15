# frozen_string_literal: true

# Migration for creating OrderSession model
class CreateOrderSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :order_sessions do |t|
      t.belongs_to :organization
      t.belongs_to :table
      t.boolean :open

      t.timestamps
    end
  end
end
