# frozen_string_literal: true

##
# Ingridient represents an ingridient used to create
# food. This is an auto-generated record, that can be
# utillized by an organization to provide information about
# the dishes they serve.
class Ingridient < ApplicationRecord
  has_and_belongs_to_many :allergenic
  has_and_belongs_to_many :produtcs
  belongs_to :organization

  validates :name, presence: true, length: {
    minimum: 2,
    maximum: 50
  }
  validates :description, presence: true, length: {
    minimum: 20,
    maximum: 240
  }

end
