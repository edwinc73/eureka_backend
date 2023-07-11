class Recipe < ApplicationRecord
  has_many :preps, dependent: :destroy
  has_many :ingredients, through: :preps
  has_many :favourite_recipes
  has_many :users, through: :favourite_recipes
  has_many :reviews
  validates :name, :description, presence: true
  has_many_attached :photos
end
