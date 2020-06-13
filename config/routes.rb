Rails.application.routes.draw do

  resources :appointment

  resources :lander, only: [:index]
  root to: 'lander#index'

end
