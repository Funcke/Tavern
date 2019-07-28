class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.boolean :paid
      t.belongs_to :table
      t.belongs_to :product
      t.belongs_to :organization
      t.timestamps
    end
  end
end
