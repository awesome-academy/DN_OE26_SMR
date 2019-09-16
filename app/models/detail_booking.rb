class DetailBooking < ApplicationRecord
  belongs_to :booking_room
  belongs_to :room
end
