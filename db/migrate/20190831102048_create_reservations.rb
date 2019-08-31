class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :date
      t.boolean :cancelled
      
      t.belongs_to :table
      t.belongs_to :organization
      t.timestamps
    end
  end
end
