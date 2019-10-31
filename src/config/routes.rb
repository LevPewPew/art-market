Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/', to: 'listings#index', as: 'root'

  get '/listings', to: 'listings#index', as: 'listings'
  post '/listings', to: 'listings#create'
  get '/listings/new', to: 'listings#new', as: 'new_listing'
  get '/listings/:id', to: 'listings#show', as: 'listing'
  put '/listings/:id', to: 'listings#update'
  patch '/listings/:id', to: 'listings#update'
  delete '/listings/:id', to: 'listings#destroy'
  get '/listings/:id/edit', to: 'listings#edit', as: 'edit_listing'
  get 'my_listings', to: 'listings#my_listings', as: 'my_listings'
  get 'my_purchases', to: 'listings#my_purchases', as: 'my_purchases'
  get 'my_sales', to: 'listings#my_sales', as: 'my_sales'

  get '/comments', to: 'comments#index', as: 'listing_comments'
  post '/comments', to: 'comments#create'
  get '/comments/new', to: 'comments#new', as: 'new_comment'
  get '/listings/:listing_id/comments/:id', to: 'comments#show', as: 'listing_comment'
  put '/listings/:listing_id/comments/:id', to: 'comments#update'
  patch '/listings/:listing_id/comments/:id', to: 'comments#update'
  delete '/listings/:listing_id/comments/:id', to: 'comments#destroy'
  get '/listings/:listing_id/comments/:id/edit', to: 'comments#edit', as: 'edit_listing_comment'

  get 'user_settings', to: 'user_details#edit', as: 'user_settings'
  put 'user_settings', to: 'user_details#update'
  put 'user_settings', to: 'user_details#update'
  patch 'user_settings', to: 'user_details#update'

  get '/payments/success', to: 'payments#success'
  post '/payments/webhook', to: 'payments#webhook'
end