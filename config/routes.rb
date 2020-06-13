Rails.application.routes.draw do

  resources :user

  resources :appointment

  resources :lander, only: [:index]
  root to: 'lander#index'

end
