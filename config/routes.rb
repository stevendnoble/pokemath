Rails.application.routes.draw do

  root to: "site#index"
  resources :pokemons, only: [:new, :create, :show]
  resources :users, except: [:index, :edit, :update]
  resources :caught_pokemons, only: [:create, :show, :destroy]
  resources :site, only: [:index, :about, :map]

  get "/map" => "site#map"

  get "/signup" => "users#new"
  post "/users" => "users#create"


  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  resources :sessions, only: [:create]

  post '/mapstate' => "mapstates#create"
  get '/mapstate' => "mapstates#index"

end

