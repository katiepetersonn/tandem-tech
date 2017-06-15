class TransactionsController < ApplicationController

  def new
    @booking = Booking.find_by!(
    permalink: params[:permalink]
    )
  end

  def create

  end



end
