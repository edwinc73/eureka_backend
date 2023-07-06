class Goal < ApplicationRecord
  belongs_to :user
  validates :calorie_goal, presence: true
end
