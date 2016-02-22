Rails.application.routes.draw do
  # mount ActionCable.server => '/cable'

  root 'application#layout'
  resource :session
  resources :songs, only: [:index]
  resources :friends, only: [:index]
end
