Rails.application.routes.draw do
  get 'file_uploads/new'
  get 'file_uploads/create'

  resources :file_uploads, only: [:new, :create]
  root to: 'file_uploads#new'
end
