# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Manager.create(username: 'tony123', email: 'tony@example.com', password: 'thisistony')
Manager.create(username: 'jon123', email: 'jon@example.com', password: 'thisisjon')
Manager.create(username: 'billy123', email: 'billy@example.com', password: 'thisisbilly')

Band.create(name: 'The Fuzz', manager_id: 1)
Band.create(name: 'Big Sneeze', manager_id: 1)
Band.create(name: 'The Wet Sprockets', manager_id: 1)
Band.create(name: 'The Squish', manager_id: 2)
Band.create(name: 'Pollies', manager_id: 2)
Band.create(name: 'The Police', manager_id: 3)
Band.create(name: 'Young Swiss', manager_id: 3)
Band.create(name: 'The Holy Mackerel', manager_id: 3)
Band.create(name: 'Snowboy', manager_id: 3)
Band.create(name: 'The Surfaris', manager_id: 2)

Member.create(name: "Johnny Rockets")
Member.create(name: "Bill Buffalo")
Member.create(name: "Ricky Nixon")
Member.create(name: "Troy Simpson")
Member.create(name: "Mary Berry")
Member.create(name: "Billy Riches")
Member.create(name: "Pappy McGoo")
Member.create(name: "Chevy Chase")
Member.create(name: "Trent Razor")
Member.create(name: "Scuba Steve")

100.times do
    BandMember.create({
        instrument: Faker::Music.instrument,
        band_id: rand(1..10),
        member_id: rand(1..10)
    })
end