Rails.application.routes.draw do
   root to: "posts#index"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :posts
  resources :comments
   get '/auth/token' => 'auth#token'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
