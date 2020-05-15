Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :products
  
  resources :orders, only: [:new]
  root 'pages#index'
  get 'pages/sneakers', as: 'sneakers'
  get 'pages/apparel', as: 'apparel'
  get 'pages/contact', as: 'contact'
  get 'pages/admin', as: 'admin'
  get 'orders/cancel', to: 'orders#cancel'
  get 'orders/complete', to: 'orders#complete'

  resources :conversations do
    resources :messages
  end
end
