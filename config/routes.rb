Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :users, only: [:show]
  resources :articles, only: [:index, :show, :new, :create, :update, :destroy]
  resources :categories, only: [:index, :show]

  namespace :writers do
    resources :categories, only: [:index, :show, :new, :update, :destroy]
    resources :articles, only: [:index, :edit, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
