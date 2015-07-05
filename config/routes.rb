Rails.application.routes.draw do
  root to: "posts#index"
  resources :posts
  get '/api/like/:user_id/:post_id' => 'api#like'
  get '/api/unlike/:user_id/:post_id' => 'api#unlike'
  get '/api/check/:user_id/:post_id' => 'api#check'
  get '/settings' => 'settings#settings'
  get '/profile/:username' => 'profile#profile'	
  match "/:controller(/:action(/:id))" , :via=>[:get,:post,:patch]
end
