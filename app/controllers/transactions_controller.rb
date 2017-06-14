class TransactionsController < ApplicationController

  def new
    @booking = Booking.find_by!(
    permalink: params[:permalink]
    )
  end

  def create

    @booking = Booking.find_by!(
    id: params[:id]
    )

    @booking.student_id = @current_user.id
    @booking.available = false

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
  end



end
