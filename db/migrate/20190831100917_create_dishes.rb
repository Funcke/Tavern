class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description
      t.decimal :price

      t.belongs_to :organization
      t.belongs_to :category
      t.timestamps
    end
  end
end
