class Item < ApplicationRecord
  has_many :decor_item
  has_many :event_item
  has_many :menu_item
  has_many :supplier_item

  enum item_type: {decor: 0, menu: 1, ent: 2}
end
