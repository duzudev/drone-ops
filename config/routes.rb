Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :projects  # Add this line to create RESTful routes for projects
  get 'lms/index'
  get 'compliance/index'
  get 'dashboard/index'
  get 'send_test_email', to: 'example#send_test_email'

  get "up" => "rails/health#show", as: :rails_health_check
  root "dashboard#index"
end
