Rails.application.routes.draw do

  root to: "public/homes#top", as: 'top'

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    resources :play_histores, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :recruits, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create, :update, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update, :destroy]do
      resource :follows, only: [:create, :destroy]
      get 'followings' => 'follows#followings', as: 'followings'
      get 'followers' => 'follows#followers', as: 'followers'
    end

    get 'following_users' => 'follows#index', as: 'following_users'
    get 'drafts', to: 'recruits#drafts', as: 'drafts'
    get 'favorites', to: 'favorites#index', as: 'favorites'
    # get 'search_play_histores'=>'playHistores#search_play_histores', as: 'search_play_histores'
  #   post '/user/:/users/:user_id/follows'
  #   patch '/users/:user_id/follows'
  #   get '/users/confirm', to: 'users#confirm', as: 'confirm'
  #   patch '/users/cancel', to: 'users#cancel', as: 'cancel'

  end

  namespace :admin do
    resources :play_histores, only: [:index,:show, :edit, :update, :destroy]
    resources :titles, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :recruits, only: [:index,:show,:edit, :update, :destroy] do
      resource :comments, only: [:destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
