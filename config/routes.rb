Rails.application.routes.draw do
  root to: "posts#index"
  resources :posts
  get '/settings/:username' => 'settings#settings'	
  match "/:controller(/:action(/:id))" , :via=>[:get,:post,:patch]
  
end
