class User < ApplicationRecord
  has_secure_password
  has_many :bookings
  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
