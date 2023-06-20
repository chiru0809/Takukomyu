Rails.application.routes.draw do
  
  namespace :public do

  end
  devise_for :admins
  devise_for :users
  
  root to: "public/homes#top", as: 'top'
  get '/about', to: 'public/homes#about', as: 'about'
  
  # scope module: :public do
  #   resources :play_histores, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
  #     resource :favorites, only: [:create, :destroy]
  #   end
  #   resources :recruits, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
  #     resource :comments, only: [:create, :update, :destroy]
  #   end
  #   resources :users, only: [:index, :show, :edit, :update]
      
  #   post '/user/:/users/:user_id/follows'
  #   patch '/users/:user_id/follows'
  #   get '/users/confirm', to: 'users#confirm', as: 'confirm'
  #   patch '/users/cancel', to: 'users#cancel', as: 'cancel'
    
  #   resources :items, only: [:index, :show]
  #   resources :orders, only: [:index, :new, :create, :show]
  #   resources :cart_items, only: [:index, :create, :update, :destroy]
  #   resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  # end
  namespace :admin do
  #   resources :play_histores, only: [:index,:show, :destroy]
    resources :titles, only: [:index, :create, :show, :edit, :update, :destroy]
  #   resources :users, only: [:index, :show, :edit, :update]
  #   resources :recruits, only: [:index,:show, :destroy] do
  #     resource :comments, only: [:destroy]
  #   end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
