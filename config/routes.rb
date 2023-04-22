Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "posts#index"

  get "posts/new", to: "posts#new"
  get "posts/:id", to: "posts#show"

  resources :posts
  # resources :users, only: [:destroy]


end
