Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :products
  
  resources :orders, only: [:new]
  get 'pages/sneakers', as: 'sneakers'
  get 'pages/apparel', as: 'apparel'
  root 'pages#index'
  get 'pages/contact', as: 'contact'
  get 'pages/admin', as: 'admin'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
