# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pet.delete_all

Pet.create(name: "Roro", species: "Water-agaam", lastSeen: { "long": "52.321178", "lat": "4.837350" }, status: "missing")
pet1 = Pet.create( { name: "Hubba", species: "Tapir", status:"seen" } )
pets = Pet.create([
    { "name": "Koala Jaap", "species": "Koala", "lastSeen": { "long": "52.3435125", "lat": "4.8820532"}, "status": "seen" },
    {  "name": "Kip Jacqueline", "species": "Kip", "lastSeen": { "long": "52.321178", "lat": "4.837386"}, "status": "missing" },
    {  "name": "konijn Pluis", "species": "konijn", "lastSeen": { "long": "52.339947", "lat": "4.880144"}, "status": "missing" },
    { "name": "kat Barrabas", "species": "kat", "lastSeen": { "long": "52.347849", "lat": "4.905719"}, "status": "found" }
    ])
