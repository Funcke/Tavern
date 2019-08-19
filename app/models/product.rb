# frozen_string_literal: true

# Product model
# Represents a products served by your orgnaization
class Product < ApplicationRecord
  has_many :orders
  belongs_to :organization
end
