class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.float :preis
      t.string :name
      t.boolean :food
      t.boolean :drink
      t.timestamps
    end
  end
end
