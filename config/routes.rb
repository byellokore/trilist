Rails.application.routes.draw do
  resources :guests
  resources :events
  resources :locales
  resources :partners
  devise_for :inviters, controllers: { registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
  get 'contact', to: 'static_pages#contact'
  resources :users
end
