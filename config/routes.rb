Rails.application.routes.draw do
  get 'pages/home'

  get 'skills/index'

  get 'skills/show'

  get 'skills/new'

  get 'skills/edit'

  get 'bookings/index'

  get 'bookings/show'

  get 'bookings/new'

  get 'bookings/edit'

  resources :users


end
