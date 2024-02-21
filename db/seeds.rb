require "open-uri"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Employee.destroy_all;
Appointment.destroy_all;
User.destroy_all;

puts "Creating users ..."
benoit = User.create!(first_name: "Benoit", last_name: "XVI", email:"JP@jesus.com", password:"coucou123");
tintin = User.create!(first_name: "Tintin", last_name:"Haddock", email:"mail@gmail.com", password: "coucou123");
puts "#{User.count} users created !"

puts "Creating employees ..."
jean = Employee.new(first_name: "Jean", last_name: "Dupont", job_title: "Champion de gobage de burgers", price_per_day: 100, user: benoit, description: "Je suis triple champion de gobage de burgers. J'ai 10 ans d'expérience et je suis disponible pour vous coacher dans votre future compétition.");
file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708507330/o8ow8hfqcksnspi8lkrt.jpg')
jean.photo.attach(io: file, filename: "jean.jpg", content_type: "image/jpg")
jean.save

# Employee.create!(first_name: "Michelle", last_name: "Dupuis", job_title: "Danseuse de tecktonik", price_per_day: 80, user: benoit, avatar_img: 'https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/qunltud7i9ctrha0eht2.jpg', description: "Danseuse professionnelle de tecktonik depuis 2006, je suis disponible pour animer vos soirées les plus folles. ");
# Employee.create!(first_name: "Bilal", last_name: "Bacha", job_title: "Imitateur d'aboiement", price_per_day: 30, user: benoit, avatar_img: 'https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/xyzftalxipkduhr85yyk.jpg', description: "Wouaf wouaf, WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF. ");
# Employee.create!(first_name: "Adam", last_name: "Martin", job_title: "Roteur professionnel", price_per_day: 30, user: benoit, avatar_img: 'https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/ojwxvlbutx7vrrisclm4.jpg', description: "Quadruple champion du monde de rotage je suis disponible pour vous coacher dans votre apprentissage. ");
# Employee.create!(first_name: "Claudia", last_name: "Moreau", job_title: "Joueuse de flûte par le nez", price_per_day: 100, user: benoit, avatar_img: 'https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/e6w54g2pd0ilqvops64z.jpg', description: "Je suis disponible pour jouer de la flûte par le nez lors de vos soirées mondaines.");
# Employee.create!(first_name: "Habib", last_name: "Aziz", job_title: "Laceur de chaussure professionnel", price_per_day: 10, user: benoit, avatar_img: 'https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/o8ow8hfqcksnspi8lkrt.jpg', description: "Je suis disponible pour lacer vos chaussures à votre place.");
# Employee.create!(first_name: "Brice", last_name: "Durand", job_title: "Imitateur de miaulement", price_per_day: 90, user: tintin, avatar_img: 'https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/mrsixqzi4lqxmxgxm4du.jpg', description: "Miaou miaou, MIAOU MIAAAAOU MIAOU. ");
# Employee.create!(first_name: "Clarisse", last_name: "Bonnet", job_title: "Péteuse professionnelle", price_per_day: 150, user: tintin, avatar_img: 'https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/e6w54g2pd0ilqvops64z.jpg', description: "Vous voulez savoir contrôler vos pets lors d'un examen important ? Je suis la personne de la situation.");
# Employee.create!(first_name: "Jeanette", last_name: "Vincent", job_title: "Parle avec les dauphins", price_per_day: 200, user: tintin, avatar_img: 'https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/fv24surswbq1s1tiqnqx.jpg', description: "Ayant vécue toute ma vie avec les dauphins, j'ai appris leur langage et je suis capable de communiquer avec eux. Je suis disponible pour vous apprendre à faire de même. ");
# Employee.create!(first_name: "Giselle", last_name: "Brun", job_title: "Doublure mains", price_per_day: 250, user: tintin, avatar_img: 'https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/vcvzgthnfo8guahny65k.jpg', description: "Vous cherchez une doublure mains pour vos films ? Je suis disponible pour vous aider. ");
# Employee.create!(first_name: "Alexia", last_name: "Roux", job_title: "Rouleuse de cigarette les yeux fermés", price_per_day: 60, user: tintin, avatar_img: 'https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/qunltud7i9ctrha0eht2.jpg', description: "Je roule des cigarettes les yeux fermés depuis l'âge de 10 ans. Je peux vous apprendre à faire de même.");
# Employee.create!(first_name: "Gérard", last_name: "Perrin", job_title: "Joueur de piano sans les mains", price_per_day: 100, user: tintin, avatar_img: 'https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/xyzftalxipkduhr85yyk.jpg', description: "Je suis capable de jouer du piano sans les mains. C'est un talent que je peux vous apprendre.");
puts "#{Employee.count} employees created!"
