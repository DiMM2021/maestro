# frozen_string_literal: true

Rails.application.routes.draw do
  get 'search', to: 'search#index'
  resources :orders
  resources :line_items
  post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
  delete 'line_items/:id' => 'line_items#destroy'
  resources :carts

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  root 'home#index'

  resources :brands, only: [:index]
  resources :items, only: %i[index show]
  resources :blogs, only: %i[index show]
  resources :contacts, only: [:index]
end
