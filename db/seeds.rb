# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Diner.create(
  name: 'Sara',
  contact_info: 'email, 123456',
  reservations_id: 1
)

Diner.create(
  name: 'Emily',
  contact_info: 'email2, 789123',
  reservations_id: 2
)

Diner.create(
  name: 'Vrunda',
  contact_info: 'email3, 567890',
  reservations_id: 3
)

Owner.create(
  name: 'Joe',
  restaurant_id: 1
)

Owner.create(
  name: 'Bob',
  restaurant_id: 2
)
Owner.create(
  name: 'Mike',
  restaurant_id: 3
)

Restaurant.create(
  name: 'Bench',
  address: 'King',
  capacity: 50,
  open_time: 12.00,
  close_time: 23.00,
  reservations_id: 1,
  owner_id: 1,
  url: 'http://i.imgur.com/AuyOIa4b.jpg',
  price_range: '$$',
  neighbourhood: 'Downtown',
  summary: 'Fun food. Canadian food. From poutine to hamburgers.'
)

Restaurant.create(
  name: 'Eat it!',
  address: 'Queen',
  capacity: '25',
  open_time: 17.30,
  close_time: 00,
  reservations_id: 2,
  owner_id: 2,
  url: 'http://i.imgur.com/w8QyKOub.jpg',
  price_range: '$$$',
  neighbourhood: 'Downtown',
  summary: 'Fancy food. Wince cellar, $100 dollar foie gras spaghetti.'
)

Restaurant.create(
  name: 'Hungry Racoon',
  address: 'Bloor',
  capacity: '100',
  open_time: 00,
  close_time: 10.15,
  reservations_id: 3,
  owner_id: 3,
  url: 'http://i.imgur.com/Kv43rafb.jpg',
  price_range: '$',
  neighbourhood: 'Midtown',
  summary: 'Cheap eats. Mac and cheese, burgers, hot dogs, sandwhiches. Come hungry!'
)

Reservation.create(
  date: '063017',
  time: 13,
  party_size: 4,
  diner_id: 1,
  restaurant_id: 1
)

Reservation.create(
  date: '062517',
  time: 15,
  party_size: 10,
  diner_id: 2,
  restaurant_id: 2
)

Reservation.create(
  date: '062017',
  time:
  9,
  party_size: 2,
  diner_id: 3,
  restaurant_id: 3
)
