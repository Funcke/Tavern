# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :questions, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :organization
  belongs_to :role
end
