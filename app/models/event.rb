class Event < ApplicationRecord
  belongs_to :client
  belongs_to :venue
  belongs_to :menu
  belongs_to :decor
  belongs_to :ent

  has_many :event_items, dependent: :destroy

  validate :unique_event_per_venue_date

  def unique_event_per_venue_date
    errors.add(:venue_is, 'in use on that day') if Event.where(venue_id: self.venue_id).where("DATE(date) = ?", self.date).count > 0
  end
end
