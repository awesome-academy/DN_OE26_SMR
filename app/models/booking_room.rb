class BookingRoom < ApplicationRecord
  has_many :detail_bookings, dependent: :destroy
  enum status: {booking_success: 0, checkin: 1, checkout: 2}
  belongs_to :user
end
