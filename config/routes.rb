# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'users#index'
  resources :inventories

  resources :users do
    collection do
      get 'home'
    end
    member do
      post 'vote'
    end
  end
end
