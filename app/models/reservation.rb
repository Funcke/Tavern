# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :organization
  belongs_to :table

  validates :date, presence: true
  validates :cancelles, presence: true
end
