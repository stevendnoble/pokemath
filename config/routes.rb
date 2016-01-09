Rails.application.routes.draw do
  
  root to: "site#index"

  get 'site/index'

  get '/tile', to: 'site#tile'

  get 'site/browsertoosmall'

  get 'site/noscrolling'

  get 'site/navbar'

  get 'site/instructions'


end
