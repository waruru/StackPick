Rails.application.routes.draw do
  authenticated :user do  # ログイン状態
    root 'posts#index', as: "user_authenticated_root"
  end
  root 'top#index'


  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :posts do
    resources :likes, only: [:create, :destroy]
  end

  resources :tags

  get 'pages/terms_of_service'
  get 'pages/privacy_policy'
end
