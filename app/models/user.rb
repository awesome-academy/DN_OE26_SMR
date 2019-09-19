class User < ApplicationRecord
  attr_accessor :remember_token

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

  class << self
    def digest string
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Password.create(string, cost: BCrypt::Engine::MIN_COST)
      else
        BCrypt::Password.create(string, cost: BCrypt::Engine.cost)
      end
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated? remember_token
    return false unless remember_digest
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute :remember_digest, nil
  end
end
