# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Post.create(title: "Books",content:"part1")
# Post.create(title: "notebook",content:"part2")
# Post.create(title: "pen",content:"part3")

# db/seeds.rb
Client.create(first_name: "Lifo", store_id: 1)
Client.create(first_name: "Fifo", store_id: 2)
Client.create(first_name: "Filo", store_id: 3)
Client.create(first_name: "Sara", store_id: 2)
Client.create(first_name: "Russel", store_id: 1)
Client.create(first_name: "James", store_id: 3)
