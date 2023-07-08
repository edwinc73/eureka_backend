class Meal < ApplicationRecord
  belongs_to :goal
  belongs_to :recipe
  validates :name, presence: true
end
