class Goal < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  validates :calorie_goal, presence: true
end
