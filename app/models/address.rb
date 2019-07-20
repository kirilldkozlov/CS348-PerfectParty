class Address < ApplicationRecord
  has_many :client_addresses, dependent: :delete_all
  has_many :venue_addresses, dependent: :delete_all
end
