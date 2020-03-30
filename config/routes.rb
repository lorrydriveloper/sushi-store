Rails.application.routes.draw do
  resources :orders
  resources :comments
  resources :categories
  resources :items
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
