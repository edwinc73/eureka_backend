class Ingredient < ApplicationRecord
  has_many :preps
  validates :name, :calories, :portion_size, presence: true
end
