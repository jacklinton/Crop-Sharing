Rails.application.routes.draw do
  get 'events/index'

  get 'events/new'

  get 'events/show'

  get 'events/edit'

  get 'events/form'

  get 'home/index'

  devise_for :users
    root to: "home#index"
    resources :listings
end
