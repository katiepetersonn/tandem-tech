Rails.application.routes.draw do
  resources :sales
  root to: "pages#home"

  resources :bookings

  post "/bookings/:id/book" => "transactions#create"
    # link_to --> "/bookings/:id/book"
    # we will need a book method in the bookings controller
    # Find the booking (params[:id])
    # Update the booking's student_id to be whoever is logged in
    # Update the booking's available property to false
    # Redirect to somewhere

  post '/comments' => 'comments#create', as: 'comments'

  resources :users do
    resources :comments
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  get "/buy/:permalink", to: "transactions#new", as: :show_buy

  post "/buy/:permalink", to:"transactions#create", as: :buy

  get "/pickup/:guid", to:"transactions#pickup", as: :pickup


end
