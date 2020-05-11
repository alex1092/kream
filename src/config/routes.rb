Rails.application.routes.draw do
  devise_for :users
  resources :apparels
  resources :sneakers
  root 'pages#index'
  get 'pages/contact', as: 'contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end