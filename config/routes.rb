Rails.application.routes.draw do
  devise_for :users
  resources :apparels
  resources :sneakers
  resources :orders, only: [:new]
  root 'pages#index'
  get 'pages/contact', as: 'contact'
  get 'pages/admin', as: 'admin'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
