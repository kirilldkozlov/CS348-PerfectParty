# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

EventItem.destroy_all
Event.destroy_all
Address.destroy_all
Venue.destroy_all
VenueAddress.destroy_all

Rating.destroy_all
SupplierItem.destroy_all
Supplier.destroy_all
MenuItem.destroy_all
Menu.destroy_all
Client.destroy_all
ClientAddress.destroy_all
DecorItem.destroy_all
Decor.destroy_all
EntItem.destroy_all
Ent.destroy_all
Item.destroy_all

waterloo = Address.create!(street_num: 1, street_name: "University St", postal_code: "N1N 6A8", city: "Waterloo",  province: "ON")
toronto = Address.create!(street_num: 2, street_name: "Yonge St", postal_code: "M1M 5A4", city: "Toronto",  province: "ON")
toronto_2 = Address.create!(street_num: 3, street_name: "King St", postal_code: "M1M 5B7", city: "Toronto",  province: "ON")

venue_waterloo = Venue.create!(name: "Wonderful Waterloo", cost: 100)
venue_toronto = Venue.create!(name: "Somewhere in Toronto", cost: 1000)
venue_toronto_2 = Venue.create!(name: "Another Toronto", cost: 1200)

VenueAddress.create!(venue: venue_waterloo, address: waterloo)
VenueAddress.create!(venue: venue_toronto, address: toronto)
VenueAddress.create!(venue: venue_toronto_2, address: toronto_2)

sup_1 = Supplier.create!(first_name: "Bob", last_name: "Builder", telephone: "1234567891", events_supplied: 3)
sup_2 = Supplier.create!(first_name: "Peter", last_name: "Painter", telephone: "1234567891", events_supplied: 1)

Rating.create!(supplier: sup_1, comment: "great", score: 5)
Rating.create!(supplier: sup_1, comment: "great!!", score: 5)

Rating.create!(supplier: sup_2, comment: "bad", score: 1)
Rating.create!(supplier: sup_2, comment: "avg", score: 3)

menu = Menu.create!(name: "Premium Pizza", desc: "The best pizza in the world!")
client = Client.create!(first_name: "Big Bill", last_name: "Guy", telephone: "4169671111", email: "bill@guy.com")

address1 = Address.create!(street_num: 10, street_name: "Albert Street", postal_code: "d3p 5e2", city: "Waterloo", province: "ON")
address2 = Address.create!(street_num: 3, street_name: "Columbia", postal_code: "g7o 3k8", city: "Milton", province: "ON" )
address3 = Address.create!(street_num: 31, street_name: "Weber Street", postal_code: "j8e 3i9", city: "Toronto", province: "ON" )
address4 = Address.create!(street_num: 56, street_name: "University Ave", postal_code: "q8d 5g7", city: "Toronto", province: "ON" )
address5 = Address.create!(street_num: 83, street_name: "Seagram", postal_code: "n3s 7j2", city: "Branford", province: "ON" )

client1 = Client.create!(first_name: "Jay", last_name: "Gatsby", telephone: "9052829182", email: "sajkas@sjak.com")
client2 = Client.create!(first_name: "Lebron", last_name: "James", telephone: "1234567890", email: "ijsjfk@dsal.com")
client3 = Client.create!(first_name: "Bugs", last_name: "Bunny", telephone: "8176389172", email: "jkfd@sjak.com")


supplier1 = Supplier.create!(first_name: "Left", last_name: "Shoe", telephone: "9052829182", events_supplied: 1)
supplier2 = Supplier.create!(first_name: "Right", last_name: "Shoe", telephone: "1234567890", events_supplied: 3)
supplier3 = Supplier.create!(first_name: "Ketch", last_name: "Up", telephone: "8176389172", events_supplied: 5)
supplier4 = Supplier.create!(first_name: "Hello", last_name: "World", telephone: "7286453645", events_supplied: 2)
supplier5 = Supplier.create!(first_name: "Bulk", last_name: "Barn", telephone: "3286478272", events_supplied: 0)
supplier6 = Supplier.create!(first_name: "Hal", last_name: "Jordon", telephone: "5189361827", events_supplied: 4)
supplier7 = Supplier.create!(first_name: "Tony", last_name: "Stark", telephone: "6381283748", events_supplied: 6)
supplier8 = Supplier.create!(first_name: "Jon", last_name: "Snow", telephone: "8203748374", events_supplied: 2)

decor1 = Decor.create!(name: "Floral", desc: "Nice")
decor2 = Decor.create!(name: "Medieval Vibes", desc: "Throwback")

ents1 = Ent.create!(name: "Fun package", desc: "It's a blast")

venue1 = Venue.create!(name: "Emporium", cost: 100)
venue2 = Venue.create!(name: "Sunflower Studio", cost: 200)
venue3 = Venue.create!(name: "Dance Hall", cost: 300)
venue4 = Venue.create!(name: "Big Barn", cost: 400)
venue5 = Venue.create!(name: "Primo", cost: 500)


item1 = Item.create!(item_type: 1, name: "Salad" , url: "url1", desc: "Ceasar", cost: 5)
item2 = Item.create!(item_type: 1, name: "Pasta" , url: "url2", desc: "Hand crafted", cost: 5)
item3 = Item.create!(item_type: 1, name: "Meatball" , url: "url3", desc: "desc3", cost: 9)
item4 = Item.create!(item_type: 1, name: "Ice Cream" , url: "url4", desc: "desc4", cost: 3)
item5 = Item.create!(item_type: 0, name: "Flowers" , url: "url5", desc: "desc5", cost: 20)
item6 = Item.create!(item_type: 0, name: "Candles" , url: "url6", desc: "desc6", cost: 8)
item7 = Item.create!(item_type: 2, name: "Retro Music" , url: "url7", desc: "desc7", cost: 100)
item8 = Item.create!(item_type: 2, name: "Disco" , url: "url8", desc: "desc8", cost: 250)
item9 = Item.create!(item_type: 2, name: "Comedian" , url: "url9", desc: "desc9", cost: 500)
item10 = Item.create!(item_type: 0, name: "item10" , url: "url10", desc: "desc10", cost: 5)
item11 = Item.create!(item_type: 0, name: "item11" , url: "url11", desc: "desc11", cost: 5)
item12 = Item.create!(item_type: 0, name: "item12" , url: "url12", desc: "desc12", cost: 5)
item13 = Item.create!(item_type: 0, name: "item13" , url: "url13", desc: "desc13", cost: 5)
item14 = Item.create!(item_type: 0, name: "item14" , url: "url14", desc: "desc14", cost: 5)
item15 = Item.create!(item_type: 0, name: "item15" , url: "url15", desc: "desc15", cost: 5)
item16 = Item.create!(item_type: 0, name: "item16" , url: "url16", desc: "desc16", cost: 5)

menu1 = Menu.create!(name: "Italian", desc: "Very authentic!")
menu3 = Menu.create!(name: "Ice Cream Party", desc: "Only Vanilla")

client_addresses1 = ClientAddress.create!(client: client1, address: address1)
client_addresses2 = ClientAddress.create!(client: client2, address: address3)
client_addresses3 = ClientAddress.create!(client: client3, address: address2)

venue_addresses1 = VenueAddress.create!(venue: venue1, address: address1)
venue_addresses2 = VenueAddress.create!(venue: venue2, address: address2)
venue_addresses3 = VenueAddress.create!(venue: venue3, address: address3)
venue_addresses4 = VenueAddress.create!(venue: venue4, address: address4)
venue_addresses5 = VenueAddress.create!(venue: venue5, address: address5)


Rating.create!(supplier: supplier1, comment: "comment1", score: 5)
Rating.create!(supplier: supplier1, comment: "comment1", score: 2)
Rating.create!(supplier: supplier1, comment: "comment1", score: 4)
Rating.create!(supplier: supplier2, comment: "comment1", score: 1)
Rating.create!(supplier: supplier2, comment: "comment1", score: 1)
Rating.create!(supplier: supplier3, comment: "comment1", score: 1)
Rating.create!(supplier: supplier3, comment: "comment1", score: 3)
Rating.create!(supplier: supplier3, comment: "comment1", score: 4)
Rating.create!(supplier: supplier3, comment: "comment1", score: 5)

menu_item1 = MenuItem.create!(menu: menu1, item: item1, quantity: 10)
menu_item2 = MenuItem.create!(menu: menu1, item: item2, quantity: 20)
menu_item3 = MenuItem.create!(menu: menu1, item: item3, quantity: 5)
menu_item4 = MenuItem.create!(menu: menu3, item: item4, quantity: 6)

decor_item1 = DecorItem.create!(decor: decor1, item: item5, quantity: 10)
decor_item2 = DecorItem.create!(decor: decor2, item: item6, quantity: 10)


ent_item1 = EntItem.create!(ent: ents1, item: item7, quantity: 2, ord: 1)
ent_item2 = EntItem.create!(ent: ents1, item: item8, quantity: 2, ord: 2)
ent_item3 = EntItem.create!(ent: ents1, item: item9, quantity: 2, ord: 3)

supplier_item1 = SupplierItem.create!(supplier: supplier1, item: item10, quantity: 2)
supplier_item2 = SupplierItem.create!(supplier: supplier1, item: item11, quantity: 5)
supplier_item3 = SupplierItem.create!(supplier: supplier2, item: item13, quantity: 3)

#Event.create!(venue: venue_waterloo, client: client, menu: menu1, decor: decor1, ent: ents1, attendees: 20, date: 1.week.from_now)
#event1 = Event.create!(client: client1, venue: venue1, menu: menu1, decor: decor1, ent: ents1, attendees: 100, date: Date.new(2019,7,20))
#event2 = Event.create!(client: client2, venue: venue2, menu: menu1, decor: decor1, ent: ents1, attendees: 200, date: 1.week.from_now)
#event_item1 = EventItem.create!(item: item14, event: event1, supplier: supplier1, quantity: 20)
