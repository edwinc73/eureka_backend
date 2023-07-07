class Ingredient < ApplicationRecord
  has_many :recipes, through: :preps
  validates :name, :calories, :portion_size, presence: true
end
