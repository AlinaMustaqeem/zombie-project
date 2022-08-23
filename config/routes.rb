# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    authenticated :user do
        root 'users#index' , as: :authenticated_root
    end

    unauthenticated :user do
      root 'devise/sessions#new' , as: :unauthenticated_root
    end
  end

  resources :inventories do
    member do
      post 'accept'
    end
  end


  resources :trades do
    member do
      post 'tradePage'
      post 'trading_request'
      post 'accept_request'

    end
  end

  resources :users do
    collection do
      get 'home'
      get 'report'
      get 'requests'
    end
    member do
      post 'vote'
    end

  end
end
