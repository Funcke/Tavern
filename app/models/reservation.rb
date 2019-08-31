class Reservation < ApplicationRecord
    belongs_to :organization
    belongs_to :table

    validates :date, presence: true
    validates :cancelles, presence: true
end
