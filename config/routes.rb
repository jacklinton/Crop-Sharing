Rails.application.routes.draw do
  get 'home/index'
  resources :contacts, only: [:new, :create]

  devise_for :users, controllers: { registrations: "registrations"}

  root "home#index"
  
end
