Rails.application.routes.draw do

  resources :lander, only: [:index]
  root to: 'lander#index'

end
