# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
require 'faker'


cities_data = [
  { name: "Paris", zip_code: "75000" },
  { name: "Marseille", zip_code: "13000" },
  { name: "Lyon", zip_code: "69000" },
  { name: "Toulouse", zip_code: "31000" },
  { name: "Nice", zip_code: "06000" },
  { name: "Nantes", zip_code: "44000" },
  { name: "Strasbourg", zip_code: "67000" },
  { name: "Montpellier", zip_code: "34000" },
  { name: "Bordeaux", zip_code: "33000" },
  { name: "Lille", zip_code: "59000" }
]

cities_data.each do |city|
  City.create(city)
end



# Créer 15 utilisateurs avec des données aléatoires
15.times do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "test#{i+1}@test.com",
    city_id: rand(1..10), # Assurez-vous d'ajuster les valeurs selon vos besoins
    password: 'mdp1234',
    password_confirmation: 'mdp1234'
  )
end

users = User.all

# Création de 30 publications avec des utilisateurs aléatoires
30.times do
  user = users.sample
  Publication.create(
    title: "Publication #{Faker::Lorem.word}",
    content: Faker::Lorem.sentence,
    user_id: user.id,
    city_id: user.id
  )
end

publications = Publication.all
# Création de 100 commentaires aléatoires sur les publications
100.times do
  user = users.sample
  publication = publications.sample
  publication = Publication.all.sample
  Comment.create(
    content: Faker::Lorem.sentence,
    user_id: user.id,
    publication_id: publication.id
  )
end
