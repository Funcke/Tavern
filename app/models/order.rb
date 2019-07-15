class Order < ApplicationRecord
    belongs_to :table
    belongs_to :product
end
