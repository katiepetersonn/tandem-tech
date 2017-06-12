class BookingsController < ApplicationController
  def index
    @all_bookings = Booking.all
    @booking = Booking.find_by(id: params["id"])
  end

  def show
    @booking = Booking.find_by(id: params["id"])
  end

  def new
    @booking = Booking.new
  end

  def create
    # need to access the users

    @booking = Booking.new( booking_params)
    @booking.student_id = @current_user.id
    # raise hell
    @booking.save
    redirect_to "/bookings/"
  end

  def edit
    @booking = Booking.find_by(id: params["id"])
  end

  def update
    # Handles the submission of a form
    booking = Booking.find_by(id: params["id"])
    booking.update ( booking_params() )
    redirect_to booking_path(booking)
  end

  def destroy
    # Deletes a particular booking
    booking = Booking.find_by(id: params["id"])
    booking.destroy
    redirect_to booking_path(booking)

  end

  private

  def booking_params
    params.require(:booking).permit(:date, :start_time, :end_time, :teacher_id, :student_id)
  end

end
