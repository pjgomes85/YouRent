class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :fullname, presence: true, length: {maximum: 50}
  has_many :rooms
  has_many :reservations
  has_many :reviews
  has_one_attached :avatar
end
