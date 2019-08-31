# frozen_string_literal: true

# Table model
# Represents a associatable location
# in your organization
class Table < ApplicationRecord
  has_many :order_groups
  belongs_to :organization

  validates :number, presence: true
  validates :seats, presence: true
  validates :description, length: {
    minimum: 20,
    maximum: 240
  }
end
