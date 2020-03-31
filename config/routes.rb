# frozen_string_literal: true

Rails.application.routes.draw do

  get '/auth/facebook/callback' => 'sessions#create'

  resources :orders
  resources :comments
  resources :categories, only: %i[index show]
  resources :items, only: %i[index show]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    get 'dashboard' => 'dashboard#index'
    resources :categories do
      resources :items, except: %i[index]
    end
    
  end

  root 'welcome#index'
end
