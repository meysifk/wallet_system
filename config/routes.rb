# frozen_string_literal: true

Rails.application.routes.draw do
  resources :wallets, only: %i[show create]
  resources :transactions, only: [:create]
  post 'sign_in', to: 'sessions#create'
end
