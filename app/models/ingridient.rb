# frozen_string_literal: true

# Ingridient mdoel
# represents an ingridient for a product
class Ingridient < ApplicationRecord
  has_and_belongs_to_many :allergenic
  has_and_belongs_to_many :produtcs
end
