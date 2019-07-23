class Client < ApplicationRecord
  has_one :client_address
  accepts_nested_attributes_for :client_address
  validates :telephone, :first_name, :last_name, :email, :presence => true #check all fields entered
  validates_format_of :first_name, :last_name, #check no numbers in names
  :multiline => true,
  :with => /^([^0-9]*)$/,
  :message => "is an invalid name"
  validates :email, uniqueness: true #check unique email
  validates_format_of :email, #check correct email format
  :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
  :message => "is in an invalid format"
  validates :telephone, length: { is: 10}, numericality: true, uniqueness: true #check 10 chars, numbers, unique
  has_many :event, dependent: :destroy

  def full_name
    first_name + " " + last_name
  end
end
