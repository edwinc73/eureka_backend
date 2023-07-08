class Prep < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  validates :portion, presence: true
end
