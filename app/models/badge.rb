class Badge < ApplicationRecord
  has_many :achievements, dependent: :destroy
end
