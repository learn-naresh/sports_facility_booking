class User < ApplicationRecord
  has_secure_password
  has_many :bookings
  has_one :profile
  accepts_nested_attributes_for  :profile
  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
