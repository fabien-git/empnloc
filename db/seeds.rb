require "open-uri"


  def average_rating(employee)
    reviews_employee = Review.where(employee: employee)
    count = 0
    reviews_employee.each do |review|
      count += review.rating
    end
    employee.rating = count / reviews_employee.count
    employee.save!

  end
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
jean = Employee.new(first_name: "Jean", last_name: "Dupont", job_title: "Champion de gobage de burgers", price_per_day: 100, user: benoit, description: "Triple champion de gobage de burgers, Jean a 10 ans d'expérience et il est disponible pour vous coacher dans votre future compétition. Glouton depuis sa tendre enfance il a su développer une technique infaillible pour avaler des burgers entiers en moins de 10 secondes.");
jean_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708507330/o8ow8hfqcksnspi8lkrt.jpg')
jean.avatar.attach(io: jean_file, filename: "jean.jpg", content_type: "image/jpg")
jean.save

michelle = Employee.new(first_name: "Michelle", last_name: "Dupuis", job_title: "Danseuse de tecktonik", price_per_day: 80, user: benoit, description: "Danseuse professionnelle de tecktonik depuis 2006, Michelle est disponible pour animer vos soirées les plus folles. Forte de 17 ans d'expérience, elle saura vous apprendre les pas les plus fous de cette danse mythique. Animatrice de soirées depuis 2010, elle saura vous faire danser jusqu'au bout de la nuit.");
michelle_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/qunltud7i9ctrha0eht2.jpg')
michelle.avatar.attach(io: michelle_file, filename: "michelle.jpg", content_type: "image/jpg")
michelle.save

bilal = Employee.new(first_name: "Bilal", last_name: "Bacha", job_title: "Imitateur d'aboiement", price_per_day: 30, user: benoit, description: "Wouaf wouaf, WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF WOUAF. ");
bilal_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/xyzftalxipkduhr85yyk.jpg')
bilal.avatar.attach(io: bilal_file, filename: "bilal.jpg", content_type: "image/jpg")
bilal.save

adam = Employee.new(first_name: "Adam", last_name: "Martin", job_title: "Roteur professionnel", price_per_day: 30, user: benoit, description: "Quadruple champion du monde de rotage Bilal est disponible pour vous coacher dans votre apprentissage. Il a 15 ans d'expérience et saura vous apprendre les techniques les plus folles pour devenir un pro du rotage. Roteur professionnel depuis 2005, il saura vous faire rire et vous apprendre à maîtriser cet art.");
adam_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/ojwxvlbutx7vrrisclm4.jpg')
adam.avatar.attach(io: adam_file, filename: "adam.jpg", content_type: "image/jpg")
adam.save

claudia = Employee.new(first_name: "Claudia", last_name: "Moreau", job_title: "Joueuse de flûte par le nez", price_per_day: 100, user: benoit, description: "Claudia est disponible pour jouer de la flûte par le nez lors de vos soirées mondaines. Elle a 10 ans d'expérience et saura animer vos soirées les plus foldingues. Ayant un nez énorme depuis sa naissance, elle a su développer une technique infaillible pour jouer de la flûte par le nez et son talent est maintenant reconnu dans le monde entier.");
claudia_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/e6w54g2pd0ilqvops64z.jpg')
claudia.avatar.attach(io: claudia_file, filename: "claudia.jpg", content_type: "image/jpg")
claudia.save

habib = Employee.new(first_name: "Habib", last_name: "Aziz", job_title: "Laceur de chaussure professionnel", price_per_day: 10, user: benoit, description: "Habib est disponible pour lacer vos chaussures à votre place. Il a commencé à lacer les chaussures de ses camarades à l'âge de 5 ans et ne s'est plus arrêté depuis. Passionné par les lacets et les chaussures, il est disponible quand vous le souhaitez pour lacer vos chaussures. Il est également disponible pour vous apprendre à lacer vos chaussures comme un pro.");
habib_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/mrsixqzi4lqxmxgxm4du.jpg')
habib.avatar.attach(io: habib_file, filename: "habib.jpg", content_type: "image/jpg")
habib.save

brice = Employee.new(first_name: "Brice", last_name: "Durand", job_title: "Imitateur de miaulement", price_per_day: 90, user: tintin, description: "Miaou miaou, MIAOU MIAAAAOU MIAOU MIAOU MIAAAAOU MIAOU MIAOU MIAAAAOU MIAOU MIAOU MIAAAAOU MIAOU MIAOU MIAAAAOU MIAOU MIAOU MIAAAAOU MIAOU MIAOU MIAAAAOU MIAOU MIAOU MIAAAAOU MIAOU MIAOU MIAAAAOU MIAOU MIAOU MIAAAAOU MIAOU MIAOU MIAAAAOU MIAOU MIAOU MIAAAAOU MIAOU MIAOU MIAAAAOU MIAOU MIAOU MIAAAAOU MIAOU. ");
brice_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/mrsixqzi4lqxmxgxm4du.jpg')
brice.avatar.attach(io: brice_file, filename: "brice.jpg", content_type: "image/jpg")
brice.save

clarisse = Employee.new(first_name: "Clarisse", last_name: "Bonnet", job_title: "Péteuse professionnelle", price_per_day: 150, user: tintin, description: "Vous voulez savoir contrôler vos pets lors d'un examen important ? Clarisse est la personne de la situation. Elle est disponible pour vous apprendre à contrôler vos pets et à les faire à la demande. Péteuse professionnelle depuis 2010, elle saura vous apprendre à péter comme un pro. ");
clarisse_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/e6w54g2pd0ilqvops64z.jpg')
clarisse.avatar.attach(io: clarisse_file, filename: "clarisse.jpg", content_type: "image/jpg")
clarisse.save

vincent = Employee.new(first_name: "Jeanette", last_name: "Vincent", job_title: "Parle avec les dauphins", price_per_day: 200, user: tintin, description: "Ayant vécue toute sa vie avec les dauphins, Jeanette a appris leur langage et est capable de communiquer avec eux. Amoureuse des dauphins depuis toujours et elle-même mariée avec un dauphin depuis 15 ans, elle est disponible pour vous apprendre à communiquer avec eux.");
vincent_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/fv24surswbq1s1tiqnqx.jpg')
vincent.avatar.attach(io: vincent_file, filename: "vincent.jpg", content_type: "image/jpg")
vincent.save

giselle = Employee.new(first_name: "Giselle", last_name: "Brun", job_title: "Doublure mains", price_per_day: 250, user: tintin, description: "Vous cherchez une doublure mains pour vos films ou vidéos ? Giselle est disponible pour vous aider. Elle a 20 ans d'expérience et a déjà doublé les mains de nombreuses stars. Ses mains sont de vrais bijoux et elle est une doublure mains de renom. Tous les cinéastes se l'arrachent, alors n'attendez plus ! ");
giselle_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/vcvzgthnfo8guahny65k.jpg')
giselle.avatar.attach(io: giselle_file, filename: "giselle.jpg", content_type: "image/jpg")
giselle.save

alexia = Employee.new(first_name: "Alexia", last_name: "Roux", job_title: "Rouleuse de cigarette les yeux fermés", price_per_day: 60, user: tintin, description: "Alexia roule des cigarettes les yeux fermés depuis l'âge de 10 ans. Tout a commencé lorsqu'elle a perdu un pari avec ses amis et depuis, elle a développé une technique infaillible pour rouler des cigarettes les yeux fermés. Elle est disponible pour vous apprendre cette technique. ");
alexia_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/qunltud7i9ctrha0eht2.jpg')
alexia.avatar.attach(io: alexia_file, filename: "alexia.jpg", content_type: "image/jpg")
alexia.save

gerard = Employee.new(first_name: "Gérard", last_name: "Perrin", job_title: "Joueur de piano sans les mains", price_per_day: 100, user: tintin, description: "Gérard est capable de jouer du piano sans les mains. C'est un talent qu'il a développé depuis l'âge de 5 ans lorsqu'il a perdu ses mains dans un accident. Il est disponible pour des concerts ou soirées privées et saura vous émerveiller avec son talent. Il est également disponible pour vous donner un petit coup de main pour apprendre à jouer.");
gerard_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1708508011/xyzftalxipkduhr85yyk.jpg')
gerard.avatar.attach(io: gerard_file, filename: "gerard.jpg", content_type: "image/jpg")
gerard.save

puts "#{Employee.count} employees created!"

puts "Creating reviews ..."
employees = Employee.all
employees.each do |employee|
  commentaires =['Une place VIP réservée pour vous, la star du jour! On prépare déjà le tapis rouge',
  "Préparez-vous à être chouchouté comme une licorne dans un champ de cupcakes. Réservation confirmée",
  " Un parcours de transformation inspirant. J'ai retrouvé ma motivation grâce à des encouragements plus forts que mon réveil matin!",
  "Atelier d'art : Une explosion créative! J'ai manié le pinceau comme un artiste maudit en quête d'absolu. Résultat : un chef-d'œuvre à faire rougir Picasso!",
  "Une expérience zen qui m'a fait voyager jusqu'aux confins de mon esprit. J'ai retrouvé la flexibilité d'un chat en quête de croquettes",
  "ne expérience relaxante à souhait. J'ai flotté comme une méduse dans l'océan de la sérénité"
];
  numbers_review =  rand(2..6)
  numbers_review.times do
    rating =  rand(2..5)
    Review.create!(employee: employee, rating: rating, comment: commentaires.sample)
  end
puts "reviews created!"

puts "Update rating employees ..."
  average_rating(employee)
end

puts "Update employees done!"
