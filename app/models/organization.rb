# frozen_string_literal: true

class Organization < ApplicationRecord
  has_many :users
  has_many :drinks
  has_many :dishes
  has_many :tables
  has_many :orders
  has_many :order_sessions
  has_many :ingridients
  has_many :roles
  has_many :categories
  
  validates :name, presence: true, uniqueness: true, length: {
    minimum: 4,
    maximum: 60
  }
  validates :phone, presence: true, uniqueness: {
    case_sensitive: false
  }, format: {
    with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/
  }
  validates :mail, presence: true, uniqueness: true, length: {
    minimum: 8,
    maximum: 70
  }, format: {
    with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  }
  validates :street, presence: true, length: {
    minimum: 6,
    maximum: 100
  }, uniqueness: true, format: {
    with: /\d\s(\D+)/
  }
  validates :town, presence: true, length: {
    minimum: 3,
    maximum: 100
  }
  validates :zipcode, presence: true, format: {
    with: /\d{4}(?:[-\s]\d{4})?/
  }
  validates :VAT, uniqueness: true
  validates :legal_name, presence: true, uniqueness: true, length: {
    minimum: 8,
    maximum: 100
  }
  validates :homepage, uniqueness: true
  validates :currency, presence: true
end
