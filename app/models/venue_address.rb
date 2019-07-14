class VenueAddress < ApplicationRecord
  belongs_to :venue
  belongs_to :address
end
