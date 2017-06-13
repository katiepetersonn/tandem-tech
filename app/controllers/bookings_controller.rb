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
    # raise hell

    redirect_to "/bookings/"
  end

  def edit
    @booking = Booking.find_by(id: params["id"])
  end

  def book
    # Find the booking (params[:id])
    @booking = Booking.find_by(id: params["id"])
    # Update the booking's student_id to be whoever is logged in
    @booking.student_id = @current_user.id
    # Update the booking's available property to false
    @booking.available = false
    
    BookingMailer.confirmation(@booking).deliver_now

    # Redirect to somewhere
    redirect_to "/bookings/"

  end

  def update
    # Handles the submission of a form
    @booking = Booking.find_by(id: params["id"])
    @booking.update ( booking_params() )
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
