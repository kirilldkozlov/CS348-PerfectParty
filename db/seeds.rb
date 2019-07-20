# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Address.destroy_all
Venue.destroy_all
VenueAddress.destroy_all

Rating.destroy_all
Supplier.destroy_all

Event.destroy_all
Menu.destroy_all
Client.destroy_all
Decor.destroy_all
Ent.destroy_all

waterloo = Address.create!(street_num: 1, street_name: "University St", postal_code: "N1N AAA", city: "Waterloo",  province: "Ontario")
toronto = Address.create!(street_num: 2, street_name: "Yonge St", postal_code: "M1M AAA", city: "Toronto",  province: "Ontario")
toronto_2 = Address.create!(street_num: 3, street_name: "King St", postal_code: "M1M BBB", city: "Toronto",  province: "Ontario")

venue_waterloo = Venue.create!(name: "Wonderful Waterloo", cost: 100)
venue_toronto = Venue.create!(name: "Somewhere in Toronto", cost: 1000)
venue_toronto_2 = Venue.create!(name: "Another Toronto", cost: 1200)

VenueAddress.create!(venue: venue_waterloo, address: waterloo)
VenueAddress.create!(venue: venue_toronto, address: toronto)
VenueAddress.create!(venue: venue_toronto_2, address: toronto_2)

sup_1 = Supplier.create!(first_name: "Bob", last_name: "Builder", telephone: 12345678, events_supplied: 3)
sup_2 = Supplier.create!(first_name: "Peter", last_name: "Painter", telephone: 12345678, events_supplied: 1)

Rating.create!(supplier: sup_1, comment: "great", score: 5)
Rating.create!(supplier: sup_1, comment: "great!!", score: 5)

Rating.create!(supplier: sup_2, comment: "bad", score: 1)
Rating.create!(supplier: sup_2, comment: "avg", score: 3)

menu = Menu.create!(name: "Premium Pizza", desc: "The best pizza in the world!")
decor = Decor.create!
client = Client.create!(first_name: "Big Bill", last_name: "Guy", telephone: "416 967 1111", email: "bill@guy.com")
ent = Ent.create!

Event.create!(venue: venue_waterloo, client: client, menu: menu, decor: decor, ent: ent, attendees: 20, date: 1.week.from_now)
