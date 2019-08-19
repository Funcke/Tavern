# frozen_string_literal: true

# Order Group model
class OrderGroup < ApplicationRecord
  has_many :orders
end
