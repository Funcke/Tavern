# frozen_string_literal: true

# Role model
# Represents a authorization zone in your organization
class Role < ApplicationRecord
  has_many :users
  belongs_to :organization
  belongs_to :level
end
