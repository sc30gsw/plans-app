Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sigin_in', to: 'users/sessions#new_guest'
  end
  root to: 'notes#index'
  resources :users, only: [:show]
  resources :intros, only: %i[new create edit update]
  resources :notes do
    resources :comments, only: [:create]
  end
end
