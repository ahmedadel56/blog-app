Rails.application.routes.draw do
  root to: 'users#index'
  get 'user_posts/index'
  get 'user_posts/show'
  get 'users/index'
  get 'users/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
