Rails.application.routes.draw do
  authenticated :user do  # ログイン状態
    root 'posts#index', as: "user_authenticated_root"
  end
  root 'posts#index'


  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  namespace :users do
    get 'icon/new'
    patch 'icon/update'
  end

  get 'account', to: 'users#show', as: 'account'

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :tags, only: [:index]
    get 'tags/remove/:id', to: 'posts/tags#remove', as: :remove_tag, on: :collection
  end

  resources :tags

  get 'pages/terms_of_service'
  get 'pages/privacy_policy'
end
