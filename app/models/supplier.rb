class Supplier < ApplicationRecord
  has_many :rating, dependent: :destroy
  has_many :supplier_item, dependent: :destroy

  def full_name
    first_name + " " + last_name
  end
end
