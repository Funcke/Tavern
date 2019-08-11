# frozen_string_literal: true

class Table < ApplicationRecord
  has_many :orders
  belongs_to :organization
end
