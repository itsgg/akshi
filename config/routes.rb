Rails.application.routes.draw do
  root to: 'subjects#index'
  get 'users', to: 'users#new'

  resources :subjects
  resources :users

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
end
