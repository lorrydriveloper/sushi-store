# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'users#create'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :orders do
    get '/checkout' => 'orders#show'
  end

  resources :categories, only: %i[index show]
  resources :items, only: %i[index show] do
    resources :comments, except: %i[new show]
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    get 'dashboard' => 'dashboard#index'
    resources :items, only: %i[index]
    resources :categories do
      resources :items, except: %i[index]
    end
    resources :users, only: %i[index]
    resources :comments, only: %i[index]
    resources :orders, only: %i[index]
  end

  root 'welcome#index'
end
