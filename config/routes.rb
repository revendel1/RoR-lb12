Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'mersen#input'
  post 'mersen/output'
  get 'mersen/output'
  get 'mersen/input'
  get 'mersen/userlist', :defaults => { :format => 'xml' }
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'mersens', to: 'mersen#show_data', as: :mersen_all
end