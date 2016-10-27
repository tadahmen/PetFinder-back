# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alatside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

user1 = User.create(username: "Harrie", password: "1234Abcd*", email: "harrie@fastmail.nl")
user2 = User.create(username: "Lisa", password: "Lisa&123", email: "lisl@gmail.com")
bert = User.create(username: "Bert", password: "bert123#", email: "b.bertjens@hotmail.nl")
user4 = User.create(username: "Mariëlle", password: "Mariëlle_3:)", email: "mariëlle@hotmail.com")


Owner.delete_all

owner1 = Owner.create(alias: "Har", user: user1)
lisa = Owner.create(alias: "Lisl", user: user2)
owner3 = Owner.create(user: bert)
owner4 = Owner.create(user: user4)


Pet.delete_all

Pet.create(name: "Roro", species: "Water-agaam", lastSeen: { "lat": "52.321178", "lng": "4.837350" }, status: "missing", owner: owner1)
pet1 = Pet.create( { name: "Hubba", species: "Tapir", status:"seen", owner: owner1 } )
pets = Pet.create([
    { name: "Koala Jaap", species: "Koala", owner: lisa, lastSeen: { "lat": "52.3435125", "lng": "4.8820532"}, status: "seen" },
    {  "name": "Kip Jacqueline", "species": "Kip", owner: lisa, "lastSeen": { "lat": "52.321178", "lng": "4.837386"}, "status": "missing" },
    {  "name": "konijn Pluis", "species": "konijn", owner: owner4, "lastSeen": { "lat": "52.339947", "lng": "4.880144"}, "status": "missing" },
    { "name": "kat Barrabas", "species": "kat", owner: owner3, "lastSeen": { "lat": "52.347849", "lng": "4.905719"}, "status": "found" }
])
