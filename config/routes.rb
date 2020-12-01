Rails.application.routes.draw do
  get 'login',  to:  'sessions#new'
  post 'login' ,  to: 'sessions#create'
  get 'logout',  to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show]
  resources :invitations, only: [:new, :create]
  resources :events
  root 'users#new'
end
