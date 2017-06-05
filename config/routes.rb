Rails.application.routes.draw do
  resources :meetings
  #devise_for :users
  get 'posts/index'
  get 'feed'=> 'posts#feed'
  root 'posts#index'
  devise_for :users
  resources :users, only: [:show, :destroy ] do
    resources :participation, only: [:create, :show, :destroy]
    get 'post/show'
  end
  #end
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
    resources :posts

  get "posts/cancel/:id", to: "participation#destroy", as: "cancel"
    get 'post/join/:id', to: 'post#join', as: 'join'
    get "myparticipations", to: "posts#myparticipations"
    get "posts/participation/cancel/:id", to: "participation#destroy", as: "destroy"
  get "participation", to: "post#participation"


  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
