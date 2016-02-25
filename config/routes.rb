Rails.application.routes.draw do
  # mount ActionCable.server => '/cable'

  root 'application#layout'
  resource :session
  resources :songs, only: [:index]
  resources :friends, only: [:index]
  resources :groups, only: [:index]
  resources :event, only: [:fire]
  get '/fire', to: 'event#fire'
  mount ActionCable.server => "/cable"
end
