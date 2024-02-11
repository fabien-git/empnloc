# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "destroy"
Employee.destroy_all;
Appointment.destroy_all;
User.destroy_all;
puts "destroy ok !!!!!"
puts "ajout des données"
User.create!(first_name: "benoit", last_name: "XVI", email:"JP@jesus.com", password:"coucou123", avatar_img:"...");
User.create!(first_name: "Tintin", last_name:"Haddock", email:"mail@gmail.com", password: "coucou123", avatar_img:"...");
puts "ok";
