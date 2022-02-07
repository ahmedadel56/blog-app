Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    # write all your routes inside this block
    root 'users#index'
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :new, :create, :show]
    end
  
    resources :posts do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
  end