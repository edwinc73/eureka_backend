class Recipe < ApplicationRecord
  has_many :preps, dependent: :destroy
  has_many :ingredients, through: :preps
  has_many :reviews
  validates :name, :description, presence: true
  has_many_attached :photos
end
