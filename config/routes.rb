Rails.application.routes.draw do

  resources :contacts, only: [:new, :create]

  devise_for :users, :controllers => { registrations: 'registrations' }

  root "home#index"
  
    resources :maps
    resources :listings
    resources :pictures
    resources :items
    resources :invites
    resources :events

end
