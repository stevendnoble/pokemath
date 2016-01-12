Rails.application.routes.draw do
  
  root to: "site#index"
  resources :pokemons, only: [:new, :create, :show]
  resources :users, except: [:index, :edit, :update]
  resources :caught_pokemons, only: [:create, :show, :destroy]

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get '/login' => "sessions#new"
  post '/login' => "sessions#create" 
  get '/logout' => "sessions#destroy"
  post '/savemap' => "site#mapstate"
end

