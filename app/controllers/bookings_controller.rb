class BookingsController < ApplicationController
  def index
    @all_bookings = Booking.all
  end

  def show
    @booking = Booking.find_by(id: params["id"])
  end

  def new
    @booking = Booking.new
  end

  def create
    # Handles the submission of a form
    @booking = Booking.create( booking_params)
    redirect_to "/bookings/booking"
  end

  def edit
    @booking = Booking.find_by(id: params["id"])
  end

  def update
    # Handles the submission of a form
    @booking = Booking.find_by(id: params["id"])
    booking.update( booking_params() )
    redirect_to "/bookings/#{booking.id}"
  end

  def destroy
    # Deletes a particular booking
    booking = Booking.find_by(id: params["id"])
    booking.destroy
    redirect_to

  end

  private

  def booking_params
    params.require(:booking).permit(:date, :start_time, :end_time)
  end

end
