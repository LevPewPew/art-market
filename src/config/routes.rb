Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  get "/", to: "pages#home", as: "root"

  resources :listings
  get "my_listings", to: "listings#my_listings", as: "my_listings"

  get "user_settings", to: "pages#user_settings", as: "user_settings"
end