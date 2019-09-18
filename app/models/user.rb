class User < ApplicationRecord
  enum activated: {active: 1, unactive: 0}
  enum role: {admin: 0, staff: 1, customer: 2}
  has_many :booking_rooms
  has_many :contacts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true,
    length: {maximum: Settings.validates.max_length_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.validates.max_length_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.validates.min_length_password}, allow_nil: true
end
