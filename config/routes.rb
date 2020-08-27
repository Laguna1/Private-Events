Rails.application.routes.draw do
  resources :events
  resources :users, only: [:new, :create]
  get 'static_pages/home', to: 'static_pages#home'
  get 'static_pages/about', to: 'static_pages#about'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'
  get 'authorized', to: 'sessions#page_requires_login'
  get '/signup', to: 'users#new'
  resources :users
  resources :sessions
 # root 'users#index'
  root 'static_pages#home'
end
