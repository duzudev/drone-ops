Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :projects do
    member do
      get 'load_section'
    end
  end

  get 'lms/index'
  get 'compliance/index'
  get 'dashboard/index'
  get 'send_test_email', to: 'example#send_test_email'

  get "up" => "rails/health#show", as: :rails_health_check
  root "dashboard#index"
end
