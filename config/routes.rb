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

  resources :inventories

  resources :users do
    collection do
      get 'home'
      get 'report'
      get 'requests'
    end
    member do
      post 'vote'
      post 'trade_request'
    end
  end
end
