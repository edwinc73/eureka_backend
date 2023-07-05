class User < ApplicationRecord
  has_many :goals, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_many :meals, dependent: :destroy
  has_many :reviews
  has_many :favourite_recipes, dependent: :destroy
  has_many :recipes, through: :meals

  validates :username, :age, :weight, :height, :gender, presence: true
  validates :username, uniqueness: true
  validates :gender, inclusion: { in: %w(m f) }
end
