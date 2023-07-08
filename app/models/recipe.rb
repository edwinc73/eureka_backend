class Recipe < ApplicationRecord
  has_many :ingredients, through: :preps
  validates :name, :description, presence: true
  has_many_attached :photos
end
