Rails.application.routes.draw do
  devise_for :users
  root to: 'notes#index'
  resources :users, only: [:show]
  resources :mypages, only: [:new, :create]
end
