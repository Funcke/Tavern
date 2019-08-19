# frozen_string_literal: true

# Table model
# Represents a associatable location
# in your organization
class Table < ApplicationRecord
  has_many :orders
  belongs_to :organization
end
