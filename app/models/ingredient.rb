class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :name, :calories, :portion_size, presence: true
end
