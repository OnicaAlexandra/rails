Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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
    resources :participation

    get "posts/cancel/:id", to: "participation#destroy", as: "cancel"
    get 'posts/join/:id', to: 'posts#join', as: 'join'
    get "myparticipations", to: "posts#myparticipations"
    #get "posts/participation/cancel/:id", to: "participation#destroy", as: "destroy"
    get "participation", to: "post#participation"
    get "show_users", to: "posts#show_users"




    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
