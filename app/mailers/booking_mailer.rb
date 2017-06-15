class BookingMailer < ApplicationMailer
  default from: "admin@tandemtech.com"

def confirmation(booking)
  @booking = booking #@user will be whatever user we pass in to the 'welcome' method
  mail( :to => @booking.student.email, :subject => "Confirmation - 1:1 Session Booking (the link to join session is in the email!)", :cc => @booking.teacher.email )
  end

end
