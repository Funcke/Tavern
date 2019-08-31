class Drink < ApplicationRecord
    belongs_to :organization
    belongs_to :category

    validates :price, presence: true
    validates :name, presence: true, length: {
        minimum: 4,
        maximum: 100
    }
    validates :quantity, presence: true
    validates :quantity_type, presence: true
end
