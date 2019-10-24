# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Stroll.destroy_all
Dog.destroy_all
Dogsitter.destroy_all
City.destroy_all

cities = []
10.times do
  cities << City.create(
        city_name: Faker::Movies::LordOfTheRings.location
  )
end

dogsitters = []
25.times do
  dogsitters << Dogsitter.create(
      first_name: Faker::Ancient.hero, 
      age: Faker::Number.between(from: 15, to: 99),
      city: cities.sample
  )
end

dogs = []
100.times do
    dogs << Dog.create(
        name: Faker::Games::Heroes.name,
        race: Faker::Creature::Dog.breed,
        city: cities.sample
    )
  end
  
  150.times do
      Stroll.create(
          date: Faker::Time.forward(days: 100, period: :day),
          dogsitter: dogsitters.sample,
          dog: dogs.sample,
          city: cities.sample
      )
    end

puts "Prêt pour la balade !"