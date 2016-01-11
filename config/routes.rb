Rails.application.routes.draw do
  
  root to: "site#index"
  resources :pokemons, only: [:new, :create, :show]

  get "/  signup" => "users#new"
  post "/users" => "users#create"

  get '/login' => "sessions#new"
  post '/login' => "sessions#create" 
  get '/logout' => "sessions#destroy"

end