# frozen_string_literal: true

Rails.application.routes.draw do
  get '/home', to: 'static_pages#home'

  get 'static_pages/contact'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
