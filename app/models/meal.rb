class Meal < ApplicationRecord
  belongs_to :goal
  belongs_to :recipe
end
