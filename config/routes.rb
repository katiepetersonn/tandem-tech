Rails.application.routes.draw do
  root to: "pages#home"

  resources :bookings

  resources :users do
    resources :comments
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

end
