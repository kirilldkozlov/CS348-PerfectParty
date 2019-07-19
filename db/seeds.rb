# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

waterloo = Address.create(street_num: 1, street_name: "University St", postal_code: "N1N AAA", city: "Waterloo",  province: "Ontario")
toronto = Address.create(street_num: 2, street_name: "Yonge St", postal_code: "M1M AAA", city: "Toronto",  province: "Ontario")

venue_waterloo = Venue.create(name: "Wonderful Waterloo", cost: 100)
venue_toronto = Venue.create(name: "Somewhere in Toronto", cost: 1000)

venue_waterloo_address = VenueAddress.create(venue: venue_waterloo, address: waterloo)
venue_toronto_address = VenueAddress.create(venue: venue_toronto, address: toronto)
