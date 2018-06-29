Rails.application.routes.draw do


  root to: 'tasks#index'
  
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'
  
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :tasks
  resources :users, only: [:show, :new, :create]
end
