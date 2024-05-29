class Booking < ApplicationRecord
  belongs_to :facility
  belongs_to :user
  validates :date, uniqueness: { scope: [:slot, :facility_id], message: 'is already booked' }
end
