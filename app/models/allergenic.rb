# frozen_string_literal: true

##
# Allergenic is a database model representing
# one allergen. Used to categorize food and
# beverages and inform people with allergies
# about the ingridients of the food.
class Allergenic < ApplicationRecord
  has_and_belongs_to_many :ingridients
  has_and_belongs_to_many :products

  validates :name, presence: true
  validates :toke, presence: true
end
