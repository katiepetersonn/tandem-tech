Rails.application.routes.draw do
  root to: "pages#home"

  resources :bookings

  post '/comments' => 'comments#create', as: 'comments'

  resources :users do
    resources :comments
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

end
