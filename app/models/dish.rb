class Dish < ApplicationRecord
    belongs_to :organization
    has_and_belongs_to_many :ingridients
    belongs_to :category

    validates :price, presence: true
    validates :name, presence:true, length: {
        minimum: 4,
        maximum: 100
    }
    validates :description, presence: true, length: {
        minimum: 20,
        maximum: 240
    }
end
