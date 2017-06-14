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

    redirect_to "/"
  end



end
