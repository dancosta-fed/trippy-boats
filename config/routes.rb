Rails.application.routes.draw do
  root to: 'pages#home'
  get '/seach', to: 'boats#search'
  get '/users', to: 'users#show'

  devise_for :users

  resources :users, only: [:show]
  resources :boats do
    resources :bookings, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
