class Venue < ApplicationRecord
  has_one :venue_address

  has_many :event, dependent: :delete_all
end
