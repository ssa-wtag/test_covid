Rails.application.routes.draw do

  resources :user

  resources :appointment

  resources :lander, only: [:index]
  root to: 'lander#index'
  put '/save_result_file', to: 'appointment#save_result_file'
  get '/upload_result', to: 'appointment#upload_result'
  get '/generate_pdf', to: 'appointment#generate_pdf'
  get '/download_pdf', to: 'appointment#download_pdf'
end
