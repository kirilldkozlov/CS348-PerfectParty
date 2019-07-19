class Client < ApplicationRecord
  has_one :client_address

  has_many :event, dependent: :delete_all
end
