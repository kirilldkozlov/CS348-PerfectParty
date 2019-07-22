class Address < ApplicationRecord
  has_many :client_addresses, dependent: :delete_all
  has_many :venue_addresses, dependent: :delete_all
  validates :street_name, :street_num, :postal_code, :city, :province, :presence => true  #check all fields entered
  validates_format_of :street_name,  #check no numbers in street name
  :multiline => true,
  :with => /^([^0-9]*)$/,
  :message => "is an invalid street name"
  validates_format_of :city, #check no numbers in city name
  :multiline => true,
  :with => /^([^0-9]*)$/,
  :message => "is an invalid city"
  validates_format_of :province,  #check no numbers in province name
  :multiline => true,
  :with => /(^[Oo][Nn][Tt][Aa][Rr][Ii][Oo]$)|(^[Qq][Uu][Ee][Bb][Ee][Cc]$)|(^[Nn][Ee][Ww][Ff][Oo][Uu][Nn][Dd][Ll][Aa][Nn][Dd][ ][Aa][Nn][Dd][ ][Ll][Aa][Bb][Rr][Aa][Dd][Oo][Rr]$)|(^[Pp][Rr][Ii][Nn][Cc][Ee][ ][Ee][Dd][Ww][Aa][Rr][Dd][ ][Ii][Ss][Ll][Aa][Nn][Dd]$)|(^[Nn][Oo][Vv][Aa][ ][Ss][Cc][Oo][Tt][Ii][Aa]$)|(^[Nn][Ee][Ww][ ][Bb][Rr][Uu][Nn][Ss][Ww][Ii][Cc][Kk]$)|(^[Mm][Aa][Nn][Ii][Tt][Oo][Bb][Aa]$)|(^[Ss][Aa][Ss][Kk][Aa][Tt][Cc][Hh][Ee][Ww][Aa][Nn]$)|(^[Aa][Ll][Bb][Ee][Rr][Tt][Aa]$)|(^[Bb][Rr][Ii][Tt][Ii][Ss][Hh][ ][Cc][Oo][Ll][Uu][Mm][Bb][Ii][Aa]$)|(^[Yy][Uu][Kk][Oo][Nn]$)|(^[Nn][Oo][Rr][Tt][Hh][Ww][Ee][Ss][Tt][ ][Tt][Ee][Rr][Rr][Ii][Tt][Oo][Rr][Ii][Ee][Ss]$)|(^[Nn][Uu][Nn][Aa][Vv][Uu][Tt]$)/,
  :message => "is an invalid province "
  validates :postal_code, format: { :multiline => true, with: /^([A-Za-z]\d[A-Za-z][ -]?\d[A-Za-z]\d)/,
    message: "Not a valid postal code" }
 
  def full_address
    "#{street_num} #{street_name}, #{city}"
  end
end


