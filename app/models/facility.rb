class Facility < ApplicationRecord
  has_many :bookings
  validates :name, :description, :location, :sports, :pincode, presence: true
end
