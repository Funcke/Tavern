# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :organization
  has_and_belongs_to_many :ingridients
  belongs_to :category
  has_and_belongs_to_many :products, :join_table => 'menu_items', :foreign_key => 'menu_id', :association_foreign_key => 'product_id'
  

  validates :price, presence: true
  validates :name, presence: true, length: {
    minimum: 4,
    maximum: 100
  }
  validates :description, presence: true, length: {
    minimum: 20,
    maximum: 240
  }
  #validates drink_has_quantity?

  #def drink_has_quantity?
  #  if type == 'drink'
  #    quantity != '' && quantity_type != ''
  #  else
  #    true
  #  end
  #end
end
