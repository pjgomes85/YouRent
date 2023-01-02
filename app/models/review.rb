class Review < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :star, presence: true, numericality:
            { greater_than_or_equal_to: 1, less_than_or_equal_to: 5,
              only_integer: true }

  # def update_reviewable_rating
  #   reviewable.update! average_rating: reviewable.reviews.average(:star)
  #   # avg + (rating - avg) / count
  # end
end
