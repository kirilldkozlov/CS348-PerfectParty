class Client < ApplicationRecord
  has_one :client_address

  has_many :event, dependent: :delete_all

  def full_name
    first_name + " " + last_name
  end
end
