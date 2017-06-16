class BookingsController < ApplicationController

  def index
    @all_bookings = Booking.all
  end

  def show
    @booking = Booking.find_by(id: params["id"])
    @teacher_bookings = @user.teacher_bookings
    @student_bookings = @user.student_bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new( booking_params)
    @booking.teacher_id = @current_user.id
    @booking.save
    #  raise hell
    redirect_to "/users/#{@current_user.id}"
  end

  def edit
    @booking = Booking.find_by(id: params["id"])
  end

  def book
    # raise "hell"
    # Find the booking (params[:id])
    @booking = Booking.find_by(id: params["id"])
    # Update the booking's student_id to be whoever is logged in
    @booking.student_id = @current_user.id
    # Update the booking's available property to false
    @booking.available = false
    @booking.save

    BookingMailer.confirmation(@booking).deliver_now

    # CREATE YOUR PAYMENT HERE

        token = params[:stripeToken]
        # binding.pry
        charge = Stripe::Charge.create(
          amount:      @booking.price,
          currency:    "aud",
          card:        token,
          description: params[:stripeEmail]
        )

        @sale = @booking.sales.create!(
          email:      params[:stripeEmail],
          stripe_id:  charge.id
        )

        # Send email
        BookingMailer.confirmation(@booking).deliver_now
        # Show booking success
        # raise "hell"

    redirect_to "/users/#{@current_user.id}"

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
    params.require(:booking).permit(:date, :start_time, :end_time, :teacher_id, :student_id, :permalink, :price)
  end

end
