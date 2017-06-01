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
   # member do
    #  get 'rsvp'
    end
    #resources :participation do
     # collection do
      #  get 'myparticipations'
      #end
    #end
    get 'posts/join/:id', to: 'posts#join', as: 'join'
    get "myparticipations", to: "posts#myparticipations"
    get "posts/cancel/:id", to: "participation#destroy", as: "cancel"


  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
