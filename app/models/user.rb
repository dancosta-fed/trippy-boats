class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :boats, through: :bookings

  has_many :host_reviews
  has_many :guest_reviews

  validates :fullname, presence: true, length: { minimum: 5 }
end
