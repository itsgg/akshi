Rails.application.routes.draw do
  root to: 'subjects#index'

  resources :subjects do
    collection do
      get 'search'
      put 'order'
    end
  end
  resources :users
  resources :attachments, only: [:create]

  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get 'static/about', as: 'about'

  namespace :admin do
    root to: 'dashboard#index'
    resources :users
  end
end
