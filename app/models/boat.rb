class Boat < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  belongs_to :user
end
