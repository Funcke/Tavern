class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name

      t.belongs_to :organization

      t.timestamps
    end

    create_join_table :ingridients, :dishes do |t|
      t.index %i[ingridient_id dish_id], name: 'ingridient_dish'
      t.index %i[dish_id ingridient_id], name: 'dish_ingridient'
    end
    add_foreign_key :dishes_ingridients, :ingridients
    add_foreign_key :dishes_ingridients, :dishes
  end
end
