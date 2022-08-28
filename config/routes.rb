# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    authenticated :user do
      root 'users#index', as: :authenticated_root
    end

    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :inventories , only: %i[index new create]

  resources :votes , only: %i[create new]

  resources :trades , only: %i[show create index destroy new] do
    member do
      post 'accept_request'
    end
  end

  resources :users , only: %i[show edit index update]do
    collection do
      get 'report'
      get 'requests'
    end
  end
  get '/*path', to: 'users#index'
end
