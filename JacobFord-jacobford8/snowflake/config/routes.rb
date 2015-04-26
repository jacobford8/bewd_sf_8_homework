Rails.application.routes.draw do
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  get '/auth/twitter', to: 'sessions#create'
  root "home#index"
end
