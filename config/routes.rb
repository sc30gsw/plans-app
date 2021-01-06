Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'notes#index'
  resources :users, only: [:show]
end
