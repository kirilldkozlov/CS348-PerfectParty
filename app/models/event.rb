class Event < ApplicationRecord
  belongs_to :client
  belongs_to :venue
  belongs_to :menu
  belongs_to :decor
  belongs_to :ent

  has_many :event_items, dependent: :destroy
end
