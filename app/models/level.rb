# frozen_string_literal: true

# Level model
# represents an access model
class Level < ApplicationRecord
  has_many :roles
end
