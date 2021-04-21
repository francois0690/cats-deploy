# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# require "open-uri"
require "down"

p "cleaning database"
Favorite.destroy_all
Animal.destroy_all
Config.destroy_all
Theme.destroy_all
User.destroy_all

# public_path = Rails.root.join("public")




# Create users

user1_avatar = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1610030970/cats/francois_irmefy.png')


f = User.new
f.first_name = "Francois"
f.last_name = "DEOUF"
f.email = "francois0690@gmail.com"
f.password = "123456"
f.password_confirmation = "123456"
f.phone = "06 73 74 75 76"
f.address = "18 rue Henri De Ridder, 60000 BEAUVAIS"
f.avatar.attach(io: user1_avatar, filename: 'user.png', content_type: 'image/png')



f.is_admin = true

# avatar_patient = Down.download('https://avatars0.githubusercontent.com/u/37520417?s=400&u=3844496654bc3484ed04269ee8ef806f4b0f6c46&v=4')
# f.avatar.attach(io: avatar_patient, filename: 'avatarf.jpg', content_type: 'image/jpg')

f.save!


u2 = User.new
u2.first_name = "Peggy"
u2.last_name = "CACHE"
u2.email = "peggy@gmail.com"
u2.password = "123456"
u2.password_confirmation = "123456"
u2.phone = "06 73 10 11 12"
u2.address = "15 rue Des Jasmins, 69008 LYON"
u2.is_admin = false
u2.save!


p "#{User.count} utilisateurs crées"



#Creation des photos
# chat 1 molly
f1 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1603464943/cats/cat5_nqyqer.jpg')
f2 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1604394690/cats/cat7_t2fvyw.jpg')

#chat2 roux
f3 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770120/cats/chatroux1_k8xvew.jpg')
f4 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770121/cats/chat18_atxybs.jpg')
f5 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770120/cats/chatroux2_nbgwkl.jpg')

#chat blanc
f6 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770121/cats/chatb1_yfqdgd.jpg')
f7 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770121/cats/chatb2_ptmnlk.jpg')
f8 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770120/cats/chatb3_ii75sc.jpg')

#chat 3 doudou
f9 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770122/cats/chat13_dvfs5j.jpg')
f10 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770638/cats/chat_tigre1_q5muxf.jpg')



#pigeon
f11 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609784672/cats/pigeon13_zodp5q.jpg')
f12 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770122/cats/pigeon10_zadp1c.jpg')

#rat
f20 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770120/cats/rat1_onbrve.jpg')
f21 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770120/cats/rat2_bz0ron.jpg')

#hasmter
f14 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770121/cats/hamster11_tr3k1r.jpg')
f15 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770121/cats/hamster10_zttjn8.jpg')
f16 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770121/cats/hamster12_jslcoy.jpg')

#chat sauvage
f17 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770121/cats/chat17_anrtwm.jpg')

#chaton
f18 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770122/cats/chat15_klomw9.jpg')
f19 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770120/cats/chat11_cjcens.jpg')

logo1 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770138/cats/logo1_mrfra1.jpg')
logo2 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1609770138/cats/logo2_zzmcfo.jpg')


# form1 = URI.open('https://res.cloudinary.com/lewagon-french/image/upload/v1610044378/4gu804dl4nbo6ktsj9v2g5s3a24k.pdf.jpg')






c8 = Animal.new
c8.name = "Ratatouille"
c8.description = "Petit rat des villes, affectueux et très sage.
J'adore cuisiner pour toute la famille.
Ma spécialité ? Le rasotto au parmesan, un régal !"
c8.color = Animal::COLOR[rand(0..(Animal::COLOR.length-1))]
c8.birth_date = "2020-04-01"
c8.sterilized = false
c8.espece = "Rongeur" #Animal::ESPECE[rand(0..(Animal::ESPECE.length-1))]
c8.race = "Rat" # Animal::CAT_RACE[rand(0..(Animal::CAT_RACE.length-1))]
c8.size = Animal::SIZE[rand(0..(Animal::SIZE.length-1))]
c8.hair = Animal::HAIR[rand(0..(Animal::HAIR.length-1))]
c8.sex = Animal::SEX[rand(0..(Animal::SEX.length-1))]
c8.cat_compatible = true
c8.dog_compatible = true
c8.child_compatible = true
c8.handicap = false
c8.photos.attach(io: f21, filename: 'cat13.jpg', content_type: 'image/jpg')
c8.photos.attach(io: f20, filename: 'cat12.jpg', content_type: 'image/jpg')
c8.contact = "francois0690@gmail.com"
c8.added_date = "2020-06-16"
c8.added_by = "Francois"
c8.host_name = "Glagla à Champagney"
c8.price = 80
c8.is_available = true
c8.save!


c9 = Animal.new
c9.name = "Roulette"
c9.description = "Hasmter trop mignon, actuellement en formation pour apprendre à courrir dans une roue.
J'aime les carottes, les navets et les calins."
c9.color = Animal::COLOR[rand(0..(Animal::COLOR.length-1))]
c9.birth_date = "2020-05-01"
c9.sterilized = false
c9.espece = "Rongeur" #Animal::ESPECE[rand(0..(Animal::ESPECE.length-1))]
c9.race = "Hamster" # Animal::CAT_RACE[rand(0..(Animal::CAT_RACE.length-1))]
c9.size = Animal::SIZE[rand(0..(Animal::SIZE.length-1))]
c9.hair = Animal::HAIR[rand(0..(Animal::HAIR.length-1))]
c9.sex = Animal::SEX[rand(0..(Animal::SEX.length-1))]
c9.cat_compatible = true
c9.dog_compatible = true
c9.child_compatible = true
c9.handicap = false
c9.photos.attach(io: f14, filename: 'cat14.jpg', content_type: 'image/jpg')
c9.photos.attach(io: f15, filename: 'cat15.jpg', content_type: 'image/jpg')
c9.photos.attach(io: f16, filename: 'cat16.jpg', content_type: 'image/jpg')
c9.contact = "francois0690@gmail.com"
c9.added_date = "2020-07-15"
c9.added_by = "Peggy"
c9.host_name = "Couysin à Oyonnax"
c9.price = 6
c9.is_available = true
c9.save!


c10 = Animal.new
c10.name = "Tourtee"
c10.description = "J'aime les trottoirs mais déteste les crottes de chiens.
J'ai habité un temps dans une jardinière de fenêtre mais j'étais allergique au basilic.
Maintenant je suis au chaud, j'ai de bonnes graines bio à manger et je cherche une famille pour m'épanouir.
Etonnement pour un pigeon, j'aime les caresses et je roucoule."
c10.color = Animal::COLOR[rand(0..(Animal::COLOR.length-1))]
c10.birth_date = "2020-07-01"
c10.sterilized = false
c10.espece = "Oiseau" #Animal::ESPECE[rand(0..(Animal::ESPECE.length-1))]
c10.race = "Pigeon" # Animal::CAT_RACE[rand(0..(Animal::CAT_RACE.length-1))]
c10.size = Animal::SIZE[rand(0..(Animal::SIZE.length-1))]
c10.hair = Animal::HAIR[rand(0..(Animal::HAIR.length-1))]
c10.sex = Animal::SEX[rand(0..(Animal::SEX.length-1))]
c10.cat_compatible = true
c10.dog_compatible = true
c10.child_compatible = true
c10.handicap = false
c10.photos.attach(io: f11, filename: 'cat11.jpg', content_type: 'image/jpg')
c10.photos.attach(io: f12, filename: 'cat12.jpg', content_type: 'image/jpg')
c10.contact = "francois0690@gmail.com"
c10.added_date = "2020-08-01"
c10.added_by = "Peggy"
c10.host_name = "Barnabé à Lyon"
c10.price = 40
c10.is_available = true
c10.save!


# Crée un chat
c1 = Animal.new
c1.name = "Piliou"
c1.description = "Petite chatte tigrée, sevrée, propre et trop mignone !
J'aime la proximité du radiateur.
Au départ timide, j'ai su gagner en confiance au fil des jours, aidée par mon petit partenaire plutôt aventurier que suit partout.
Je ronronne facilement et aime les lasers sur les murs.
Ma passion ? La paté tout simplement"
c1.color = Animal::COLOR[rand(0..(Animal::COLOR.length-1))]
c1.birth_date = "2020-07-01"
c1.sterilized = false
# c1.espece = Animal::ESPECE[rand(0..(Animal::ESPECE.length-1))]
c1.espece = "Chat"
c1.race = "Européen"
# c1.race = Animal::CAT_RACE[rand(0..(Animal::CAT_RACE.length-1))]
c1.size = Animal::SIZE[rand(0..(Animal::SIZE.length-1))]
c1.hair = Animal::HAIR[rand(0..(Animal::HAIR.length-1))]
c1.sex = Animal::SEX[rand(0..(Animal::SEX.length-1))]
c1.cat_compatible = true
c1.dog_compatible = true
c1.child_compatible = true
c1.handicap = false #rand > 0.5
c1.photos.attach(io: f1, filename: 'cat1.jpg', content_type: 'image/jpg')
c1.photos.attach(io: f2, filename: 'cat2.jpg', content_type: 'image/jpg')
c1.contact = "francois0690@gmail.com"
c1.added_date = "2020-08-23"
c1.added_by = "François"
c1.host_name = "Skud à Hilton"
c1.price = 110
c1.is_available = true
c1.save!


c2 = Animal.new
c2.name = "Roockmount"
c2.description = "Chatte sénior rouquine, calme, propre et caline.
J'aime dormir ou faire la sièste, au calme, toujours.
J'ai un léger handicap sur une patte arrière mais cela ne me gène pas car j'ai passé l'age de sauter sur les canapés.
Je suis très caline et ronronne très facilement. Je dors volontier dans le lit faisant office de bouillote pour mon humain.
Attention, je déteste les enfants."
c2.color = Animal::COLOR[rand(0..(Animal::COLOR.length-1))]
c2.birth_date = "2014-08-01"
c2.sterilized = true
c2.espece = "Chat" #Animal::ESPECE[rand(0..(Animal::ESPECE.length-1))]
c2.race = "Européen" # Animal::CAT_RACE[rand(0..(Animal::CAT_RACE.length-1))]
c2.size = Animal::SIZE[rand(0..(Animal::SIZE.length-1))]
c2.hair = Animal::HAIR[rand(0..(Animal::HAIR.length-1))]
c2.sex = Animal::SEX[rand(0..(Animal::SEX.length-1))]
c2.cat_compatible = true
c2.dog_compatible = true
c2.child_compatible = false
c2.handicap = true
c2.photos.attach(io: f3, filename: 'cat3.jpg', content_type: 'image/jpg')
c2.photos.attach(io: f4, filename: 'cat4.jpg', content_type: 'image/jpg')
c2.photos.attach(io: f5, filename: 'cat5.jpg', content_type: 'image/jpg')

c2.contact = "peggy@gmail.com"
c2.added_date = "2020-09-18"
c2.added_by = "Peggy"
c2.host_name = "Floflo à Pierre-Chatel"
c2.price = 60
c2.is_available = true
c2.save!



c3 = Animal.new
c3.name = "Doudou"
c3.description = "Petite chatte trop mignonne.
Véritable moteur à ronron, j'adore les calins et les jeux en tous genre.
Je suis à l'affut du moindre bruit et suis très curieuse.
Une fenêtre ou un balcon devrons impérativement être sécurisée car je suis trop tentée par les trucs qui passent devant moi."
c3.color = Animal::COLOR[rand(0..(Animal::COLOR.length-1))]
c3.birth_date = "2020-06-01"
c3.sterilized = true
c3.espece = "Chat" #Animal::ESPECE[rand(0..(Animal::ESPECE.length-1))]
c3.race = "Européen" # Animal::CAT_RACE[rand(0..(Animal::CAT_RACE.length-1))]
c3.size = Animal::SIZE[rand(0..(Animal::SIZE.length-1))]
c3.hair = Animal::HAIR[rand(0..(Animal::HAIR.length-1))]
c3.sex = Animal::SEX[rand(0..(Animal::SEX.length-1))]
c3.cat_compatible = true
c3.dog_compatible = true
c3.child_compatible = true
c3.handicap = true
c3.photos.attach(io: f9, filename: 'cat9.jpg', content_type: 'image/jpg')
c3.photos.attach(io: f10, filename: 'cat10.jpg', content_type: 'image/jpg')
c3.contact = "francois0690@gmail.com"
c3.added_date = "2020-09-02"
c3.added_by = "Peggy"
c3.host_name = "Lucie à Poligny"
c3.price = 140
c3.is_available = true
c3.save!





c5 = Animal.new
c5.name = "Blanquette"
c5.description = "Petite chatte du mois de juin 2020, propre et joueuse.
Deteste le boeuf mais raffole du saumon.
J'ai une expérience de chasseusse de mouche incomparable.
Par contre, j'ai un peu peur des chiens.
Je me laisse carresser facilement et ronronne.
J'ai besoin d'une famille pour m'épanouir."
c5.color = Animal::COLOR[rand(0..(Animal::COLOR.length-1))]
c5.birth_date = "2020-06-01"
c5.sterilized = true
c5.espece = "Chat" #Animal::ESPECE[rand(0..(Animal::ESPECE.length-1))]
c5.race = "Européen" # Animal::CAT_RACE[rand(0..(Animal::CAT_RACE.length-1))]
c5.size = Animal::SIZE[rand(0..(Animal::SIZE.length-1))]
c5.hair = Animal::HAIR[rand(0..(Animal::HAIR.length-1))]
c5.sex = Animal::SEX[rand(0..(Animal::SEX.length-1))]
c5.cat_compatible = true
c5.dog_compatible = false
c5.child_compatible = true
c5.handicap = false
c5.photos.attach(io: f6, filename: 'cat6.jpg', content_type: 'image/jpg')
c5.photos.attach(io: f7, filename: 'cat7.jpg', content_type: 'image/jpg')
c5.photos.attach(io: f8, filename: 'cat8.jpg', content_type: 'image/jpg')
c5.contact = "francois0690@gmail.com"
c5.added_date = "2020-10-16"
c5.added_by = f.first_name
c5.host_name = "Nico à Corenc"
c5.price = 130
c5.is_available = true
# c5.adoption_date = "2020-08-20"
c5.save!





c6 = Animal.new
c6.name = "GroOoaaar"
c6.description = "Petit chat typé sauvage.
Quoi dire à part que je suis trop mignon ? Rien.
Je serais déjà probablement adopté avant que vous ayez eu le temps de bouger.
Ma passion, la chasse aux insectes..."
c6.color = Animal::COLOR[rand(0..(Animal::COLOR.length-1))]
c6.birth_date = "2020-10-07"
c6.sterilized = true
c6.espece = "Chat" #Animal::ESPECE[rand(0..(Animal::ESPECE.length-1))]
c6.race = "Européen" # Animal::CAT_RACE[rand(0..(Animal::CAT_RACE.length-1))]
c6.size = Animal::SIZE[rand(0..(Animal::SIZE.length-1))]
c6.hair = Animal::HAIR[rand(0..(Animal::HAIR.length-1))]
c6.sex = Animal::SEX[rand(0..(Animal::SEX.length-1))]
c6.cat_compatible = true
c6.dog_compatible = true
c6.child_compatible = true
c6.handicap = false
c6.photos.attach(io: f17, filename: 'cat17.jpg', content_type: 'image/jpg')
c6.contact = "francois0690@gmail.com"
c6.added_date = "2020-12-02"
c6.added_by = "Francois"
c6.host_name = "Seb à Illkirch"
c6.price = 240
c6.is_available = true
c6.save!






c7 = Animal.new
c7.name = "Bouboule"
c7.description = "Petit chaton tout neuf et trop mignon.
Je ne suis pas seuvré mais j'adore déjà jouer.
J'ai actuellement une maman qui s'occupe bien de moi et qui me donne une éducation féline.
Ce que je préfère après le jeu, c'est me frotter contre vos jambes et venir sur vos genoux."
c7.color = Animal::COLOR[rand(0..(Animal::COLOR.length-1))]
c7.birth_date = "2020-12-01"
c7.sterilized = false
c7.espece = "Chat" #Animal::ESPECE[rand(0..(Animal::ESPECE.length-1))]
c7.race = "Européen" # Animal::CAT_RACE[rand(0..(Animal::CAT_RACE.length-1))]
c7.size = Animal::SIZE[rand(0..(Animal::SIZE.length-1))]
c7.hair = Animal::HAIR[rand(0..(Animal::HAIR.length-1))]
c7.sex = Animal::SEX[rand(0..(Animal::SEX.length-1))]
c7.cat_compatible = true
c7.dog_compatible = true
c7.child_compatible = true
c7.handicap = false
c7.photos.attach(io: f18, filename: 'cat18.jpg', content_type: 'image/jpg')
c7.photos.attach(io: f19, filename: 'cat19.jpg', content_type: 'image/jpg')
c7.contact = "francois0690@gmail.com"
c7.added_date = "2021-04-01"
c7.added_by = "Peggy"
c7.host_name = "Maxime à Lyon"
c7.price = 95
c7.is_available = true
c7.save!






p "#{Animal.count} animaux crées"


# Crée 2 thème

t1 = Theme.new
t1.name = "Les Cats Trop Mignons"
t1.basic_description = "Trouvez votre chat chez LCTM !"
t1.full_description = "Nous avons toute sorte de chats, pour le moment placés en familles d'accueil, qui n'attendent que vous"
t1.email = "francois0690@gmail.com"
t1.phone = "0682587155"
t1.address = "15 rue des Jasmis, 69008 Lyon"
t1.siret_number = "123 456 798 00001"
t1.legal_mention = "Association Loi 1901"
t1.facebook_url = "https://www.facebook.com/"
t1.logo.attach(io: logo1, filename: 'cat_logo1.jpg', content_type: 'image/jpg')
avatar1 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1603552716/cats/patte_chat_coeur_ltjeiq.jpg')
t1.avatar.attach(io: avatar1, filename: 'cat_avatar1.jpg', content_type: 'image/jpg')

# from cloudinary
# form1 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1610030870/cats/mon_formulaire_anfgwv.pdf')
# t1.sign_form.attach(io: form1, filename: 'mon_formulaire.pdf', content_type: 'application/pdf')

# from public folder
# t1.sign_form.attach(io: File.open("#{public_path}/mon_formulaire.pdf"), filename: 'mon_formulaire.pdf', content_type: 'application/pdf')

t1.background_color = '#e8e8e8'
t1.save!



t2 = Theme.new
t2.name = "Les Oreilles Fraiches"
t2.basic_description = "Trouvez votre chat chez LOF !"
t2.full_description = "Spécialisés dans les chats mignons, vous trouverez votre bonheur sur notre site. N'hésitez pas à faire un don pour nous soutenir"
t2.email = "peggy@gmail.com"
t2.phone = "0682838485"
t2.address = "43 rue des Jonquilles, 69008 Lyon"
t2.siret_number ="987 654 321 00002"
t2.legal_mention = "Association Identification R.N.A. : W12346789"
t2.instagram_url = "https://www.instagram.com/"
t2.logo.attach(io: logo2, filename: 'cat_logo2.jpg', content_type: 'image/jpg')
avatar2 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1603552720/cats/patte_chat1_oyds91.jpg')
t2.avatar.attach(io: avatar2, filename: 'cat_avatar2.jpg', content_type: 'image/jpg')
# form2 = Down.download('https://res.cloudinary.com/lewagon-french/image/upload/v1610030870/cats/mon_formulaire_anfgwv.pdf')
# t2.sign_form.attach(io: form2, filename: 'formulaire.pdf', content_type: 'application/pdf')
t2.background_color = '#1f6f8b'
t2.save!


p "#{Theme.count} thème crée"

#Crée la config
conf  = Config.new
# conf.name = t1.name
conf.theme = t1
conf.save!

p "#{Config.count} configuration créee"
