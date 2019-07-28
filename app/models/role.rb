class Role < ApplicationRecord
    has_many :users
    belongs_to :organization
    belongs_to :level
end
