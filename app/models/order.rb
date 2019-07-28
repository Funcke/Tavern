class Order < ApplicationRecord
    belongs_to :table
    belongs_to :product
    belongs_to :organization
end
