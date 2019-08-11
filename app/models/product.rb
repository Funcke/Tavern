# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :orders
  belongs_to :organization
end
