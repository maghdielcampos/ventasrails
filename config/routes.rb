Rails.application.routes.draw do
  # get 'purchases/new'
  # get 'purchases/create'
  #
  # resources :purchases, only: [:new, :create]
  # root to: 'purchases#new'

  root "purchases#new"
  resources :purchases, only: [:new, :create, :index]
end
