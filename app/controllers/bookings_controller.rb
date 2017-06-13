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
    @booking = Booking.new( booking_params)
    @booking.teacher_id = @current_user.id
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
    # raise "hell"
    @booking = Booking.find_by(id: params["id"])
    teacher_id = @booking.teacher_id
    @booking.destroy
    redirect_to "/users/#{teacher_id}"
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :start_time, :end_time, :teacher_id, :student_id)
  end

end
