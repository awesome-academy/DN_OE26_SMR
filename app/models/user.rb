class User < ApplicationRecord
  enum activated: {active: 1, unactive: 0}
  enum role: {admin: 0, staff: 1, customer: 2}
  has_many :booking_rooms
  has_many :contacts, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
