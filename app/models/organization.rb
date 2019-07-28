class Organization < ApplicationRecord
    has_many :roles
    has_many :users
    has_many :products
    has_many :tables
    has_many :orders
end
