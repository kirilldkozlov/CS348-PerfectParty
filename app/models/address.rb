class Address < ApplicationRecord
  has_many :client_addresses, dependent: :destroy
  has_many :venue_addresses, dependent: :destroy
  validates :street_name, :street_num, :postal_code, :city, :province, :presence => true  #check all fields entered
  validates_format_of :street_name,  #check no numbers in street name
  :multiline => true,
  :with => /^([^0-9]*)$/,
  :message => "is an invalid street name"
  validates_format_of :city, #check no numbers in city name
  :multiline => true,
  :with => /^([^0-9]*)$/,
  :message => "is an invalid city"

  validates :postal_code, format: { :multiline => true, with: /^([A-Za-z]\d[A-Za-z][ -]?\d[A-Za-z]\d)/,
    message: "Not a valid postal code" }

  PROVINCES = %w[AB BC MB NB NL NS NT NU ON PE QC SK YT]
  validates :province, inclusion: { in: PROVINCES, message: "is an invalid province" }

  def full_address
    "#{street_num} #{street_name}, #{city}"
  end
end
