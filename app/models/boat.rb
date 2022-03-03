class Boat < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  has_many :guest_reviews
  belongs_to :user

  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true
end
