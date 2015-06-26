Rails.application.routes.draw do
  get '/settings' => 'settings#settings'	
  resources :posts
  root to: "posts#index"
  match "/:controller(/:action(/:id))" , :via=>[:get,:post,:patch]
  
end
