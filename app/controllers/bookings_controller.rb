class BookingsController < ApplicationController
  before_action :authorize_request, except: [:available_slots, :show]  

  def index
    bookings = Booking.where(facility_id: params[:facility_id], date: params[:date])
    render json: bookings
  end
  
  def available_slots
    date = params[:date]
    facility_id = params[:facility_id]
    booked_slots = Booking.where(date: date, facility_id: facility_id).pluck(:slot)
    available_slots = (0..23).to_a - booked_slots
    render json: available_slots
  end
  
  def create
    booking = Booking.new(booking_params)
    booking.user = @current_user
    if Booking.exists?(facility_id: booking.facility_id, date: booking.date, slot: booking.slot)
      render json: { error: 'Slot already booked' }, status: :unprocessable_entity
    elsif booking.save
      render json: booking, status: :created
    else
      render json: booking.errors, status: :unprocessable_entity
    end
  end

  def show
    booking = Booking.find(params[:id])
    render json: booking
  end

  private

  def booking_params
    params.require(:booking).permit(:facility_id, :date, :slot, :user_id)
  end

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      decoded = JsonWebToken.decode(token)
      @current_user = User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end

