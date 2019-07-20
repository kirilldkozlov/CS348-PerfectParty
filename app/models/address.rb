class Address < ApplicationRecord
  has_many :client_addresses, dependent: :delete_all
  has_many :venue_addresses, dependent: :delete_all

  def full_address
    "#{street_num} #{street_name}, #{city}"
  end
end
