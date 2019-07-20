class Supplier < ApplicationRecord
  has_many :rating, dependent: :delete_all
  has_many :supplier_item, dependent: :delete_all

  def full_name
    first_name + " " + last_name
  end
end
