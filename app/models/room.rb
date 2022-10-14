class Room < ApplicationRecord
  belongs_to :user
  has_many :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :acommodate, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true

  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "No-Image.jpeg"
    end
  end
end
