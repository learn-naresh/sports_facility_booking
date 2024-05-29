Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :facilities, only: [:index, :show]
  get 'bookings/available_slots', to: 'bookings#available_slots'
  resources :bookings, only: [:create, :show]
  post 'register', to: 'users#register'
  post 'login', to: 'users#login'
end
