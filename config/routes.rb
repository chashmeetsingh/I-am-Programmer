Rails.application.routes.draw do

  root to: "posts#index"
  match "/:controller(/:action(/:id))" , :via=>[:get,:post,:patch]
  resources :posts
  
end
