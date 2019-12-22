# frozen_string_literal: true

# Migration creating Organization model
class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :phone
      t.string :mail
      t.string :street
      t.string :town
      t.string :zipcode
      t.string :VAT
      t.string :legal_name
      t.string :logo
      t.string :homepage
      t.string :currency

      t.timestamps
    end
  end
end
