class Venue < ApplicationRecord
  has_one :venue_address, dependent: :delete

  has_many :event, dependent: :destroy

  accepts_nested_attributes_for :venue_address, :allow_destroy => true
end
