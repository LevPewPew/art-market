Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users', to: 'users/registrations#index', as: 'users'
    delete '/users/:id', to: 'users/registrations#destroy_other', as: 'user'
  end
  
  get '/', to: 'listings#index', as: 'root'
  
  get '/user_details/:id', to: 'user_details#show', as: 'user_detail'
  put '/user_details/:id', to: 'user_details#update'
  patch '/user_details/:id', to: 'user_details#update'
  get '/user_details/:id/edit', to: 'user_details#edit', as: 'edit_user_detail'

  get '/admin_dashboard', to: 'pages#admin_dashboard', as: 'admin_dashboard'
  get '/site_stats', to: 'pages#site_stats', as: 'site_stats'

  get '/listings', to: 'listings#index', as: 'listings'
  post '/listings', to: 'listings#create'
  get '/listings/new', to: 'listings#new', as: 'new_listing'
  get '/listings/:id', to: 'listings#show', as: 'listing'
  put '/listings/:id', to: 'listings#update'
  patch '/listings/:id', to: 'listings#update'
  delete '/listings/:id', to: 'listings#destroy'
  get '/listings/:id/edit', to: 'listings#edit', as: 'edit_listing'
  get '/my_listings', to: 'listings#my_listings', as: 'my_listings'
  get '/my_purchases', to: 'listings#my_purchases', as: 'my_purchases'
  get '/my_sales', to: 'listings#my_sales', as: 'my_sales'

  get '/comments', to: 'comments#index', as: 'listing_comments'
  post '/comments', to: 'comments#create'
  get '/comments/new', to: 'comments#new', as: 'new_comment'
  get '/listings/:listing_id/comments/:id', to: 'comments#show', as: 'listing_comment'
  put '/listings/:listing_id/comments/:id', to: 'comments#update'
  patch '/listings/:listing_id/comments/:id', to: 'comments#update'
  delete '/listings/:listing_id/comments/:id', to: 'comments#destroy'
  get '/listings/:listing_id/comments/:id/edit', to: 'comments#edit', as: 'edit_listing_comment'

  get '/payments/success', to: 'payments#success'
  post '/payments/webhook', to: 'payments#webhook'

  get 'unauthorized', to: 'pages#no_access', as: 'no_access'
  get '*path', to: 'pages#page_not_found', constraints: lambda { |req| req.path.exclude? 'rails/active_storage' }
end