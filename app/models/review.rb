class Review < ApplicationRecord
  belongs_to :room
  belongs_to :reservation
  belongs_to :user
  validates :comment, length: {minimum: 20}
end
