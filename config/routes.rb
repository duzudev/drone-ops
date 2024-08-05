Rails.application.routes.draw do

  resources :projects do
    member do
      get 'load_section'
    end
  end

  get "password", to: 'passwords#edit', as: :edit_password
  patch 'password', to: 'passwords#update'

  get "sign_up", to: 'registrations#new'
  post "sign_up", to: 'registrations#create'

  get "sign_in", to: 'sessions#new'
  post "sign_in", to: 'sessions#create'

  delete "logout", to: "sessions#destroy"

  get 'lms/index'
  get 'compliance/index'
  get 'dashboard/index'


  get "up" => "rails/health#show", as: :rails_health_check
  root "dashboard#index"
end
