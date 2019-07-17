class Supplier < ApplicationRecord
  has_many :rating
  has_many :supplier_item
end
