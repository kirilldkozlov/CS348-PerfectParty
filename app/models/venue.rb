class Venue < ApplicationRecord
  has_one :venue_address, dependent: :delete

  has_many :event, dependent: :delete_all
end
