# frozen_string_literal: true

# Role model
# Represents a authorization zone in your organization
class Role < ApplicationRecord
  has_many :users
  belongs_to :organization
  has_and_belongs_to_many :rights
  validates :name, presence: true, length: {
    minimum: 5,
    maximum: 50
  }
end
