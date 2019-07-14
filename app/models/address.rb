class Address < ApplicationRecord
  has_many :client_addresses
  has_many :venue_addresses
end
