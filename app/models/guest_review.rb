class GuestReview < ApplicationRecord
  belongs_to :user
  belongs_to :boat
end
