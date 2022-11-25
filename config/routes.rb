Rails.application.routes.draw do
  # get 'bookings/show'
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/edit'
  # get 'bookings/update'
  # get 'bookings/destroy'

  devise_for :users
  root to: "pages#home"
  get '/bookings', to: 'bookings#index'
  get '/profile', to: 'pages#profile'
  patch '/profile', to: 'pages#update_profile'

  resources :listings do
    resources :bookings #, only: [:show, :create, :edit, :update, :destroy]
  end
end
