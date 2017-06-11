class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_sessions

  # before_action :lucky_number
  before_action :fetch_user
    # Before any request in our system is handled, try and define @current_user (call fetch_user to do that)

  private
    def lucky_number
      @lucky_number = Random.rand(1..100)
    end

    def fetch_user
      @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
      session[:user_id] = nil unless @current_user.present?

      # Check in the session variable
        # If there is a key called :user_id
          # Create an instance variable called @current_user that can be used on every page
          # If you can't find a user with that ID
            # Set session[:user_id] to nil
        # If there isn't a key called user_id
          # Do nothing
    end
end
