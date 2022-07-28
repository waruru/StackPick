Rails.application.routes.draw do
  authenticated :user do  # ログイン状態
    root 'posts#index', as: "user_authenticated_root"
  end
  root 'top#index'
  
  devise_for :users
  resources :posts
  resources :tags
end
