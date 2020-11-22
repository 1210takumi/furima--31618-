Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users
  root to: 'items#index'
  resources :items, only:[:create]
  resources :cards, only: [:new, :create]
end