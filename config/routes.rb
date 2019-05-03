Rails.application.routes.draw do
  resources :guests
  resources :events
  resources :locales
  resources :partners
  devise_for :inviters, controllers: {  registrations:  "registrations",
                                                  confirmations:  "confirmations",
                                                  sessions:  "sessions"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'events#index'
  get 'contact', to: 'static_pages#contact'
  #TODO look for a better way to not send get url params
  get 'add_guest/:seo_url', to: 'guests#new_to_list'
  #resources :users
end
