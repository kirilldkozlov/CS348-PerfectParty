Rails.application.routes.draw do
  root 'clients#index'

  get "ratings/new/:supplier_id", to: "ratings#new",  as: :supplier_new_rating

  get "addresses/new/:client", to: "addresses#new",  as: :client_new_address
  get "addresses/new/:venue", to: "addresses#new",  as: :venue_new_address

  get "clients/new/:address", to: "clients#new",  as: :new_client_with_address
  get "venues/new/:address", to: "venues#new",  as: :new_venue_with_address

  match "events/upcoming" => "events#upcoming", as: :events_upcoming, via: :get

  resources :event_items
  resources :events
  resources :decor_items
  resources :decors
  resources :ent_items
  resources :ents
  resources :menu_items
  resources :menus
  resources :supplier_items
  resources :ratings, except: [:show, :edit, :update]
  resources :suppliers
  resources :items
  resources :venue_addresses
  resources :client_addresses
  resources :addresses
  resources :venues
  resources :clients
end
