Rails.application.routes.draw do
  get 'comments/likes'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index,:new, :show]
  end
  root to: 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
