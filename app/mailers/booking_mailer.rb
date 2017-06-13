class BookingMailer < ApplicationMailer
  default from: "admin@tandemtech.com"

def confirmation(user)
  @user = user #@user will be whatever user we pass in to the 'welcome' method
  mail( :to => @user.email, :subject => "Confirmation - 1:1 Session Booking (the link to join session is in the email!)")
  end

end
