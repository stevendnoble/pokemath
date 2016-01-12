Rails.application.routes.draw do
  
  root to: "site#index"
  resources :pokemons, only: [:new, :create, :show]
  resources :users, except: [:index, :edit, :update]
  resources :caught_pokemons, only: [:create, :show, :destroy]

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  resources :sessions, only: [:create]


end

