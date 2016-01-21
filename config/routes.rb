Rails.application.routes.draw do
  resources :transactions,only: [:new, :create]
  resources :reservations
  resources :listings
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
  end

  post '/checkout' => 'braintrees#client_checkout'
end
