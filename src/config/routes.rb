Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/', to: 'pages#home', as: 'root'

  get '/listings', to: 'listings#index', as: 'listings'
  post '/listings', to: 'listings#create'
  get '/listings/new', to: 'listings#new', as: 'new_listing'
  get '/listings/:id', to: 'listings#show', as: 'listing'
  put '/listings/:id', to: 'listings#update'
  patch '/listings/:id', to: 'listings#update'
  delete '/listings/:id', to: 'listings#destroy'
  get '/listings/:id/edit', to: 'listings#edit', as: 'edit_listing'
  get 'my_listings', to: 'listings#my_listings', as: 'my_listings'

  get 'user_settings', to: 'user_details#edit', as: 'user_settings'
  put 'user_settings', to: 'user_details#update'
  patch 'user_settings', to: 'user_details#update'


end