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
benoit = User.new(first_name: "Benoit", last_name: "XVI", email:"JP@jesus.com", password:"coucou123");
benoit_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1707414578/samples/smile.jpg')
benoit.photo.attach(io: benoit_file, filename: "benoit.jpg", content_type: "image/jpg")
benoit.save

tintin = User.new(first_name: "Tintin", last_name:"Haddock", email:"mail@gmail.com", password: "coucou123");
tintin_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1707414581/samples/man-portrait.jpg')
tintin.photo.attach(io: tintin_file, filename: "tintin.jpg", content_type: "image/jpg")
tintin.save

puts "#{User.count} users created !"

puts "Creating employees ..."
jean = Employee.new(first_name: "Jean", last_name: "Dupont", job_title: "Champion de gobage de burgers", price_per_day: 100, user: benoit, description: "Je suis triple champion de gobage de burgers. J'ai 10 ans d'expérience et je suis disponible pour vous coacher dans votre future compétition.");
jean_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708507330/o8ow8hfqcksnspi8lkrt.jpg')
jean.avatar.attach(io: jean_file, filename: "jean.jpg", content_type: "image/jpg")
jean.save

michelle = Employee.create!(first_name: "Michelle", last_name: "Dupuis", job_title: "Danseuse de tecktonik", price_per_day: 80, user: benoit, description: "Danseuse professionnelle de tecktonik depuis 2006, je suis disponible pour animer vos soirées les plus folles. ");
michelle_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/qunltud7i9ctrha0eht2.jpg')
michelle.avatar.attach(io: michelle_file, filename: "michelle.jpg", content_type: "image/jpg")
michelle.save

bilal = Employee.create!(first_name: "Bilal", last_name: "Bacha", job_title: "Imitateur d'aboiement", price_per_day: 30, user: benoit, description: "Wouaf wouaf, WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF. ");
bilal_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/xyzftalxipkduhr85yyk.jpg')
bilal.avatar.attach(io: bilal_file, filename: "bilal.jpg", content_type: "image/jpg")
bilal.save

adam = Employee.create!(first_name: "Adam", last_name: "Martin", job_title: "Roteur professionnel", price_per_day: 30, user: benoit, description: "Quadruple champion du monde de rotage je suis disponible pour vous coacher dans votre apprentissage. ");
adam_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/ojwxvlbutx7vrrisclm4.jpg')
adam.avatar.attach(io: adam_file, filename: "adam.jpg", content_type: "image/jpg")
adam.save

claudia = Employee.create!(first_name: "Claudia", last_name: "Moreau", job_title: "Joueuse de flûte par le nez", price_per_day: 100, user: benoit, description: "Je suis disponible pour jouer de la flûte par le nez lors de vos soirées mondaines.");
claudia_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/e6w54g2pd0ilqvops64z.jpg')
claudia.avatar.attach(io: claudia_file, filename: "claudia.jpg", content_type: "image/jpg")
claudia.save

habib = Employee.create!(first_name: "Habib", last_name: "Aziz", job_title: "Laceur de chaussure professionnel", price_per_day: 10, user: benoit, description: "Je suis disponible pour lacer vos chaussures à votre place.");
habib_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/mrsixqzi4lqxmxgxm4du.jpg')
habib.avatar.attach(io: habib_file, filename: "habib.jpg", content_type: "image/jpg")
habib.save

brice = Employee.create!(first_name: "Brice", last_name: "Durand", job_title: "Imitateur de miaulement", price_per_day: 90, user: tintin, description: "Miaou miaou, MIAOU MIAAAAOU MIAOU. ");
brice_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/mrsixqzi4lqxmxgxm4du.jpg')
brice.avatar.attach(io: brice_file, filename: "brice.jpg", content_type: "image/jpg")
brice.save

clarisse = Employee.create!(first_name: "Clarisse", last_name: "Bonnet", job_title: "Péteuse professionnelle", price_per_day: 150, user: tintin, description: "Vous voulez savoir contrôler vos pets lors d'un examen important ? Je suis la personne de la situation.");
clarisse_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/e6w54g2pd0ilqvops64z.jpg')
clarisse.avatar.attach(io: clarisse_file, filename: "clarisse.jpg", content_type: "image/jpg")
clarisse.save

vincent = Employee.create!(first_name: "Jeanette", last_name: "Vincent", job_title: "Parle avec les dauphins", price_per_day: 200, user: tintin, description: "Ayant vécue toute ma vie avec les dauphins, j'ai appris leur langage et je suis capable de communiquer avec eux. Je suis disponible pour vous apprendre à faire de même. ");
vincent_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/fv24surswbq1s1tiqnqx.jpg')
vincent.avatar.attach(io: vincent_file, filename: "vincent.jpg", content_type: "image/jpg")
vincent.save

giselle = Employee.create!(first_name: "Giselle", last_name: "Brun", job_title: "Doublure mains", price_per_day: 250, user: tintin, description: "Vous cherchez une doublure mains pour vos films ? Je suis disponible pour vous aider. ");
giselle_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/vcvzgthnfo8guahny65k.jpg')
giselle.avatar.attach(io: giselle_file, filename: "giselle.jpg", content_type: "image/jpg")
giselle.save

alexia = Employee.create!(first_name: "Alexia", last_name: "Roux", job_title: "Rouleuse de cigarette les yeux fermés", price_per_day: 60, user: tintin, description: "Je roule des cigarettes les yeux fermés depuis l'âge de 10 ans. Je peux vous apprendre à faire de même.");
alexia_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/qunltud7i9ctrha0eht2.jpg')
alexia.avatar.attach(io: alexia_file, filename: "alexia.jpg", content_type: "image/jpg")
alexia.save

gerard = Employee.create!(first_name: "Gérard", last_name: "Perrin", job_title: "Joueur de piano sans les mains", price_per_day: 100, user: tintin, description: "Je suis capable de jouer du piano sans les mains. C'est un talent que je peux vous apprendre.");
gerard_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/xyzftalxipkduhr85yyk.jpg')
gerard.avatar.attach(io: gerard_file, filename: "gerard.jpg", content_type: "image/jpg")
gerard.save

puts "#{Employee.count} employees created!"
