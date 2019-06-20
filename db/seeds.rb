# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Tafang Joshua",
    email: "tafodinho@gmail.com",
    password:              "password",
    password_confirmation: "password")

10.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name:  name,
        email: email,
        password:              password,
        password_confirmation: password)
end

creators = User.order(:created_at).take(6)

9.times do 
    title = Faker::Lorem.sentence(3)
    venue = Faker::Lorem.sentence(2)
    date = Faker::Date.forward
    creators.each{ |creator|
        creator.events.create!(title: title, venue: venue, date: date)
    }
end

creators = User.order(:created_at).offset(6).take(6)

5.times do 
    title = Faker::Lorem.sentence(3)
    venue = Faker::Lorem.sentence(2)
    date = Faker::Date.backward
    creators.each{ |creator|
        creator.events.create!(title: title, venue: venue, date: date)
    }
end