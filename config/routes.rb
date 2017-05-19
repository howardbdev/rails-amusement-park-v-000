Rails.application.routes.draw do
  root 'sessions#new'

  resources :users

  resources :sessions, only: [:new, :create, :destroy]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :attractions
  resources :rides, only: [:new, :create]
end
