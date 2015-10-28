Rails.application.routes.draw do
  root "welcome#index"
  get "/auth/twitter", as: :login
  get "/auth/twitter/callback", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  resources :users, only: [:show]
  resources :tweets, only: [:new, :create]
  resources :favorites, only: [:new, :create]
  resources :statuses, only: [:show, :index]
end
