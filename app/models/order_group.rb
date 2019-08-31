# frozen_string_literal: true

# Order Group model
class OrderGroup < ApplicationRecord
  has_many :orders
  belongs_to :organization
  belongs_to :table

  validates :open, presence: true
end
