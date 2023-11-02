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
