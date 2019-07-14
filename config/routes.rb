Rails.application.routes.draw do
  resources :event_items
  resources :events
  resources :decor_items
  resources :decors
  resources :ent_items
  resources :ents
  resources :menu_items
  resources :menus
  resources :supplier_items
  resources :ratings
  resources :suppliers
  resources :items
  resources :venue_addresses
  resources :client_addresses
  resources :addresses
  resources :venues
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
