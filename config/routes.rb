Rails.application.routes.draw do

  root to: "pages#home"

  resources :bookings
  resources :sales

  post "/bookings/:id/book" => "bookings#book"
    # link_to --> "/bookings/:id/book"
    # we will need a book method in the bookings controller
    # Find the booking (params[:id])
    # Update the booking's student_id to be whoever is logged in
    # Update the booking's available property to false
    # Redirect to somewhere

  post '/comments' => 'comments#create', as: 'comments'
  delete '/comments/:id' => 'comments#destroy'

  resources :users do
    # resources :comments
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

end
