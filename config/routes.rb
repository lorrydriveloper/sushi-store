Rails.application.routes.draw do
  resources :orders
  resources :comments
  resources :categories, only: %i[index show]
  resources :items, only: %i[index show]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    # get 'dashboard' => 'admin#dashboard'
  resources :categories, only: %i[new create edit update destroy]
  resources :items, only: %i[new create edit update destroy]
  end

  root 'welcome#index'
end
