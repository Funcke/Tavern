# frozen_string_literal: true

# Allergenic model
# Represents an allergene
class Allergenic < ApplicationRecord
  has_and_belongs_to_many :ingridients
  has_and_belongs_to_many :products
end
