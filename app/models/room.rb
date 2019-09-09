class Room < ApplicationRecord
  enum status: {empty_room: 0, room_booked: 1}
  has_many :reviews, dependent: :destroy
  belongs_to :category
end
