Rails.application.routes.draw do
  resources :meetings
  #devise_for :users
  #get 'posts/index'
  get 'posts/index'
  get 'feed'=> 'posts#feed'
  root 'posts#index'
  devise_for :users
  resources :users, only: [:show]
  resources :posts do
  	resources :comments
    
  end

  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
