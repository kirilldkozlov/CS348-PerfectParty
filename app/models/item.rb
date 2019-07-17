class Item < ApplicationRecord
  has_many :decor_item
  has_many :event_item
  has_many :menu_item
  has_many :supplier_item

  enum type: %i[decor menu ent]
end
