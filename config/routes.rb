Rails.application.routes.draw do

  root to: "site#index"
  resources :pokemons, only: [:new, :create, :show]
  resources :users, except: [:index, :edit, :update]
  resources :caught_pokemons, only: [:create, :show, :destroy]
  resources :site, only: [:index, :about, :map]
  resources :sessions, only: [:create]

  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"

  get "/map", to: "site#map"
  get "/battle", to: "pokemon#show"
  post "/mapstate", to: "mapstates#create"
  get "/mapstate", to: "mapstates#index"

end

