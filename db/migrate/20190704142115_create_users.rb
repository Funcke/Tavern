class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.belongs_to :organization
      t.belongs_to :role
      t.timestamps
    end
  end
end
