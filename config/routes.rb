Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sigin_in', to: 'users/sessions#new_guest'
  end
  root to: 'notes#index'
  get 'notes/order_index', to: 'notes#order_index'
  get 'favorites/user/:id', to: 'favorites#user'
  get 'comments/user/:id', to: 'comments#user'
  get 'notes/favorite/:id', to: 'notes#favorite'
  resources :users, only: [:show]
  resources :intros, only: %i[new create edit update]
  resources :notes do
    resources :favorites, only: %i[create destroy]
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
end
