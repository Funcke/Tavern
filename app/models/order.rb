# frozen_string_literal: true

# Order model
# represents a order of products
class Order < ApplicationRecord
  belongs_to :table
  belongs_to :product
  belongs_to :organization
  belongs_to :order_group
end
