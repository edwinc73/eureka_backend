class Recipe < ApplicationRecord
  has_many :ingredients
  validates :name, :description, presence: true
  has_many_attached :photos
end
