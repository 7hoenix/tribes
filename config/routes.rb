Rails.application.routes.draw do
  root "welcome#index"
  get "/auth/twitter", as: :login
  get "/auth/twitter/callback", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  resources :users, only: [:show]
  resources :tweets, only: [:new, :create]
  resources :favorites, only: [:create, :destroy]
  resources :retweets, only: [:create]
  post "unfollow", as: :unfollow, to: "users#unfollow"
end
