Rails.application.routes.draw do

  devise_for :users
    root to: "home#index"
    resources :listings
    resources :pictures
    resources :items
    resources :invites
    resources :events
end
