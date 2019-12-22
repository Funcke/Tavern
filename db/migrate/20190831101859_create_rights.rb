# frozen_string_literal: true

class CreateRights < ActiveRecord::Migration[5.2]
  def change
    create_table :rights do |t|
      t.string :name

      t.timestamps
    end
  end
end
