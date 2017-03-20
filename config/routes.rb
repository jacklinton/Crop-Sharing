Rails.application.routes.draw do

  resources :contacts, only: [:new, :create]

  devise_for :users, :controllers => { registrations: 'registrations' }

  root "home#index"
    resources :users, only: [:show, :update]
    resources :maps
    resources :listings
    resources :pictures
    resources :items
    resources :invites
    resources :events

  # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash
  
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

end
