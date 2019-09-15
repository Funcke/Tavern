# frozen_string_literal: true

# Order model
# represents a order of products
class Order < ApplicationRecord
  belongs_to :organization
  belongs_to :order_session
  belongs_to :drink
  belongs_to :dish
end
