Rails.application.routes.draw do
  root to: "pages#home"

  resources :users

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy'



end
