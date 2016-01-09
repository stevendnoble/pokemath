Rails.application.routes.draw do
  
  root to: "site#index"
  resources :pokemons, only: [:new, :create, :show]

end