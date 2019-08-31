# frozen_string_literal: true

# User model
class User < ApplicationRecord
  has_secure_password
  has_many :questions, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :organization
  belongs_to :role

  validates :email, presence: true, format: {
    with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  }, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: {
    minimum: 5,
    maximum: 70
  }
  validates :firstname, presence: true, length: {
    minimum: 3, 
    maximum: 50
  }
  validates :lastname, presence: true, length: {
    minimum: 2,
    maximum: 70
  }
  validates :gender, presence: true, format: {
    with: /(male|female)/
  }
  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true, length: {
    minimum: 8,
    maximum: 70
  }, format: {
    with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  }
end
