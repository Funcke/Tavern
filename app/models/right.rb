# frozen_string_literal: true

class Right < ApplicationRecord
  has_and_belongs_to_many :roles
end
