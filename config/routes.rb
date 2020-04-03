# frozen_string_literal: true

Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'users#create'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :orders do
    get '/checkout' => 'orders#show'
  end
  resources :comments
  resources :categories, only: %i[index show]
  resources :items, only: %i[index show]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    get 'dashboard' => 'dashboard#index'
    resources :items, only: %i[index]
    resources :categories do
      resources :items, except: %i[index]
    end
    
  end

  root 'welcome#index'
end
