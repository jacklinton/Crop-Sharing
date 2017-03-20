Rails.application.routes.draw do

  get 'maps/_form'

  get 'maps/_small'

  get 'maps/_large'

  get 'home/index'
  resources :contacts, only: [:new, :create]

  devise_for :users, :controllers => { registrations: 'registrations' }

  root "home#index"
  

    resources :listings
    resources :pictures
    resources :items
    resources :invites
    resources :events

end
