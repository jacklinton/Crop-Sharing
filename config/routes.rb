Rails.application.routes.draw do
  get 'home/ListingTable'
  get 'home/blog'
  get 'home/index'

  resources :listings

  devise_for :users
    root to: "home#index"

end
