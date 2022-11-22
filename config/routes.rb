Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/profile', to: 'pages#profile'
  patch '/profile', to: 'pages#update_profile'
  resources :listings do
  end
end
