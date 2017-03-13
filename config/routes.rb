Rails.application.routes.draw do
  get 'pictures/_form'

  get 'pictures/new'

  get 'pictures/edit'

  get 'items/_form'

  get 'items/new'

  get 'items/edit'

  get 'invites/_form'

  get 'invites/new'

  get 'invites/edit'

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
