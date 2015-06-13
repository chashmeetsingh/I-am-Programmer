Rails.application.routes.draw do
  get 'user/profile'

  devise_for :users
  resources :posts
  root to: "posts#index"
end
