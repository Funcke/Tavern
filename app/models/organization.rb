# frozen_string_literal: true

# Organization model
# Represents a manageable organization
class Organization < ApplicationRecord
  has_many :roles
  has_many :users
  has_many :products
  has_many :tables
  has_many :orders
  has_many :order_groups
end
