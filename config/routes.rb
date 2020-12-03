Rails.application.routes.draw do
  get 'sign_up',  to:  'users#new'
  get 'login',  to:  'sessions#new'
  post 'login' ,  to: 'sessions#create'
  get 'logout',  to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show]
  resources :invitations, only: [:index,  :new, :create]
  resources :events
  root 'events#index'
end
