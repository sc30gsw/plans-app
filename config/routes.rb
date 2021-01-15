Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  # ゲストログインのルーティング
  devise_scope :user do
    post 'users/guest_sigin_in', to: 'users/sessions#new_guest'
  end
  root to: 'notes#index'

  # 新着順(投稿)を取得
  get 'notes/order_index', to: 'notes#order_index'

  # いいねしてくれたユーザーを表示するためのルーティング
  get 'favorites/user/:id', to: 'favorites#user'

  # コメントした投稿を表示するためのルーティング
  get 'comments/user/:id', to: 'comments#user'

  # いいねした投稿を表示するためのルーティング
  get 'notes/favorite/:id', to: 'notes#favorite'

  # フォローしているユーザー一覧のルーティング
  get 'followings/user/:id', to: 'relationships#followings'

  # フォロワー一覧のルーティング
  get 'followers/user/:id', to: 'relationships#followers'

  # マイページ
  resources :users, only: [:show]

  # プロフィール編集ページ
  resources :intros, only: %i[new create edit update]

  # 投稿(いいね・コメント)
  resources :notes do
    resources :favorites, only: %i[create destroy]
    resources :comments, only: [:create]
  end

  # コメント削除機能のルーティング
  resources :comments, only: [:destroy]

  # フォロー機能のルーティング
  resources :relationships, only: [:create, :destroy]

  # 通知機能のルーティング
  resources :notifications, only: [:index, :destroy]
end