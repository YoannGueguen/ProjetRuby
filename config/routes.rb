Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  localized do
    root 'homepage#index'

    post '/listings/contact', to: 'listings#contact', as: 'listing_contact'
    resources :listings
    resources :foots
    resources :legals
    

    namespace :account do
      root 'messages#index'
      resources :messages
      resources :contacts
      resources :user
      resources :comments
    end
  end
end
