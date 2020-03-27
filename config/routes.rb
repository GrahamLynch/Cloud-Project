Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users, :controllers => {:registrations => :registrations}
  root 'pages#home'

  resources :users do
  resources :profiles
  end
  resources :accountinfo
  resources :products do
    resources :comments
  end

  resources :relationships
  get 'preferences', to: 'products#preferences'
  get 'profiles', to: 'pages#profiles'
  get 'following', to: 'pages#following'
  get 'search', to: 'products#search'

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
