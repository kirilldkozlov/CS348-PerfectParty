class Venue < ApplicationRecord
  has_one :venue_addresses

  has_many :event, dependent: :delete_all
end
