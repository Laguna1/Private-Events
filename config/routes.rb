Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete '/logout',  to: 'sessions#destroy'
  get 'authorized', to: 'sessions#page_requires_login'
  get '/signup', to: 'users#new'
  resources :users
  root 'users#index'
end
