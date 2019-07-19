class Supplier < ApplicationRecord
  has_many :rating, dependent: :delete_all
  has_many :supplier_item, dependent: :delete_all
end
