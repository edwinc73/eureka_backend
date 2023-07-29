class Recipe < ApplicationRecord
  has_many :preps, dependent: :destroy
  has_many :ingredients, through: :preps
  has_many :favourite_recipes
  has_many :users, through: :favourite_recipes
  has_many :reviews
  validates :name, :description, presence: true
  attribute :seed_data, :boolean, default: false
  has_one_attached :photos
end
