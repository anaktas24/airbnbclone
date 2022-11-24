Rails.application.routes.draw do
  # get 'bookings/index'
  # get 'bookings/show'
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/edit'
  # get 'bookings/update'
  # get 'bookings/destroy'

  devise_for :users
  root to: "pages#home"
  get '/profile', to: 'pages#profile'
  patch '/profile', to: 'pages#update_profile'
  resources :bookings do
  end
  resources :listings do
  end
end
