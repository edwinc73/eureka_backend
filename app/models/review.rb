class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  delegate :username, to: :user
  validates :rating, :content, presence: true
end
