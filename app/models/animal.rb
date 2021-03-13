# schema
# t.boolean :is_available
# t.string :name
# t.string :description
# t.string :race
# t.date :birth_date
# t.string :sex
# t.integer :sterilized
# t.string :hair
# t.string :color
# t.string :dress
# t.string :size
# t.boolean :cat_compatible
# t.boolean :dog_compatible
# t.boolean :child_compatible
# t.boolean :handicap
# t.string :contact
# t.date :added_date
# t.string :added_by
# t.string :host_name
# t.date :adoption_date

class Animal < ApplicationRecord
  # include PgSearch::Model
  has_many :favorites, dependent: :destroy
  has_many_attached :photos
  has_many :users, through: :favorites

  # serialize :sex, JSON
  # serialize :race, JSON

  DOG_RACE = ["Airedale Terrier",  "Akita Américain","Akita Inu",  "American Bully",  "American Hairless Terrier",  "American stafford",  "Anglo français","Ariégeois",  "Azawakh", "Barbet",  "Barbu Tchèque", "Barzoï (Lévrier Russe)", "Basenji",  "Basset Bleu de Gascogne",  "Basset Griffon Vendéen",  "Basset Hound",  "Basset fauve de Bretagne", "Beagle",  "Bearded Collie ", "Beauceron", "Bedlington Terrier",  "Berger", "Berger Allemand", "Berger Australien", "Berger Belge",  "Berger Belge Groenendael", "Berger Blanc Suisse",  "Berger Catalan",  "Berger Hongrois",  "Berger Malinois", "Berger Picard", "Berger Polonais",  "Berger Roumain des Carpates", "Berger Yougoslave",  "Berger d'Anatolie (Kangall)", "Berger des Pyrénées", "Berger des Shetland ",  "Berger du Caucase",  "Berger hollandais",  "Berger marocain",  "Berger portugais", "Bichon Maltais", "Bichon frisé",  "Bleu de Gascogne", "Bobtail",  "Bodeguero",  "Bolonka Zwetna", "Border Collie",  "Border terrier",  "Boston Terrier", "Bouledogue Français",  "Bouledogue américain",  "Bouledogue anglais", "Bouvier Bernois",  "Bouvier Entlebuch",  "Bouvier Suisse",  "Bouvier australien",  "Bouvier des Ardennes", "Bouvier des Flandres", "Boxer",  "Brabançon", "Braque Allemand", "Braque Français",  "Braque Hongrois",  "Braque Portugais", "Braque d'Auvergne", "Braque de Weimar", "Briard", "Briquet Griffon Vendéen",  "Briquet de Provence", "Bruno du Jura", "Bull Terrier", "Bulldog", "Bullmastiff", "Cairn Terrier",  "Canaan Dog", "Cane Corso", "Caniche (Grand)", "Caniche (Moyen)", "Caniche (Nain)", "Caniche miniature (Toy)", "Carlin", "Cavalier King Charles",  "Cesky Terrier",  "Chesapeake bay retriever",  "Chien courant",  "Chien croisé","Chien croisé grande race","Chien croisé moyenne race","Chien croisé petite race",  "Chien créole",  "Chien d'eau espagnol",  "Chien d'eau portugais",  "Chien loup de saarloos",  "Chien loup tchécoslovaque ", "Chien nu Chinois", "Chihuahua",  "Chin ou (Tchin)", "Chow Chow",  "Clumber Spaniel",  "Cocker Americain",  "Cocker Anglais",  "Colley",  "Corsinus", "Coton de Tulear", "Dalmatien", "Dobermann",  "Dogo Canario", "Dogue Allemand", "Dogue Argentin", "Dogue de Bordeaux",  "Dogue de Majorque", "Dogue du Tibet",  "Drahthaar",  "Epagneul Anglais",  "Epagneul Bleu Picardie", "Epagneul Breton", "Epagneul Français",  "Epagneul Gallois",  "Epagneul Japonais",  "Epagneul Nain Continental", "Epagneul Papillon", "Epagneul Picard",  "Epagneul Pont Audemer", "Epagneul du Tibet", "Eurasier",  "Fauve de Bretagne",  "Fila Brasileiro",  "Fila de Sao Miguel",  "Flat Coated Retriever", "Fox Terrier",  "Galgo",  "Gascon Saintongeois", "Golden Retriever", "Greyhound", "Griffon",  "Groendal",  "Groenlandais",  "Hokkaïdo", "Hovawart", "Husky",  "Irish Terrier", "Irish Wolfhound", "Jack Russell", "Jagd Terrier",  "Japonais",  "Kangal",  "Kerry Blue Terrier",  "Khortal Griffon", "Komondor", "Labrador",  "Labrit",  "Laekenois",  "Lagotto Romagnolo",  "Lakeland Terrier", "Landseer",  "Langhaar",  "Lapinkoïra", "Leonberg",  "Lhassa Apso",  "Lion Occitanie",  "Lucernois", "Lévrier Afghan",  "Lévrier Arabe Sloughi",  "Lévrier Espagnol",  "Lévrier Italien",  "Malamute",  "Manchester Terrier",  "Mastiff Anglais",  "Matin Majorque",  "Montagne Atlas",  "Montagne Portugais Estrela",  "Montagne des Pyrénées",  "Munsterlander",  "Mâtin Espagnol",  "Mâtin de Naples",  "Norwich Terrier",  "Nu du Mexique",  "Nu du Perou",  "Olde English Bouledogue",  "Parson Russell terrier",  "Petit Chien Lion",  "Pinscher",  "Podenco",  "Pointer",  "Poitevin",  "Porcelaine",  "Pékinois", "Ratier",  "Ratier de Prague Prazsky Krysa",  "Rhodesian Ridgeback",  "Rottweiler",  "Rouge de Hanovre",  "Royal Bourbon",  "Russkiy Toy",  "Saint Bernard",  "Saint Hubert",  "Saluki",  "Samoyède",  "Schapendoes",  "Schipperke",  "Schnauzer géant",  "Schnauzer moyen",  "Schnauzer nain",  "Scottish Terrier ",  "Setter Anglais",  "Setter Gordon",  "Setter Irlandais",  "Shar Peï",  "Shiba Inu",  "Shih Tzu",  "Silky Terrier",  "Skye Terrier",  "Slovensky Kopov",  "Spitz Allemand",  "Spitz japonais",  "Stabyhoun (Chien d'arrêt Frison)",  "Staffordshire Bull Terrier",  "Suedois de Laponie",  "Teckel",  "Terre Neuve",  "Terrier Irlandais",  "Terrier Tcheque",  "Terrier du Tibet",  "Tervueren",  "Tosa Inu",  "Wachtelhund Oysel Allemand",  "Welsh Corgi Cardigan",  "Welsh Corgi Pembroke",  "Welsh Terrier",  "Westie",  "Whippet",  "Yorkshire Terrier" ].sort <<  "Race indéfinie"

  HORSE_RACE = [ "Andalou",  "Ane",  "Anglo arabe",  "Appaloosa",  "Barbe",  "Camarguais",  "Double poney",  "Frison",  "Lusitanien",  "Merens",  "Mule",  "Palomino",  "Poney",  "Pur sang arabe",  "Quarter Horse",  "Selle Français",  "Shetland",  "Trotteur",  "Type Selle",  "Type Trait" ].sort << "Race indéfinie"

  RABBIT_RACE = ["Bélier français",  "Géant blanc du Bouscat",  "Géant des Flandres",  "Géant papillon français" ].sort <<  "Race indéfinie"

  CAT_RACE = ['Abyssin', 'American Curl', 'American Shorthair', 'American Wirehair', 'Anatoli', 'Angora Turc', 'Asian', 'Australian Mist', 'Balinais', 'Bengal', 'Bleu Russe', "Bobtail américain", "Bobtail des Kouriles", "Bobtail japonais", "Bombay", "Brazilian shorthair", "British longhair", "British shorthair", "Burmese", "Burmilla", "Californian rex", "Californian spangled", "Ceylan", "Chartreux", "Chantilly", "Chausie", "Colorpoint shorthair", "Cornish rex", "Cymric", "Devon rex", "Donskoy", "Européen", "Exotic shorthair", "German Rex", "Havana Brown", "Highland fold", "Himalayen", "Khao Manee", "Korat", "LaPerm", "Maine coon", "Mandarin", "Manx", "Mau arabe", "Mau égyptien", "Minskin", "Munchkin", "Nebelung", "Norvégien", "Ocicat", "Ojos azules", "Oriental shorthair", "Persan", "Peterbald", "Pixie-bob", "Ragamuffin", "Ragdoll", "Sacré de Birmanie", "Safari", "Savannah", "Scottish fold", "Selkirk rex", "Serengeti", "Seychellois", "Siamois", "Sibérien", "Singapura", "Skookum", "Snowshoe", "Sokoké", "Somali", "Sphynx", "Thaï", "Tiffany", "Tonkinois", "Toyger", "Turc de Van", "Ural rex", "York chocolat" ].sort << "Race indéfinie"

  MOUSE_RACE = ["Chien de prairie", "Chinchilla", "Cobaye - Cochon d’Inde", "Ecureuil", "Gerbille", "Hamster", "Octodon", "Rat", "Souris" ].sort << "Race indéfinie"

  FERRET_RACE = ["Furet Albinos", "Furet Putoisé Champagne", "Furet Putoisé Zibeline" ].sort << "Race indéfinie"

  BIRD_RACE = ["Diamant Mandarin", "Canari", "Diamant de Gould", "Mainate Religieux", "Inséparable", "Perruche Calopsitte", "Perruche Ondulée", "Amazone", "Youyou du Sénégal", "Gris du Gabon", "Pigeon", "Tourterelle" ].sort << "Race indéfinie"

  REPTILE_RACE = ["Serpent des blés", "Python royal", "Gecko Leopard", "Dragon Barbu", "Scinque à la langue bleue", "Varan", "Cameleon", "Tortue", "Tortue Russe", "Tortue africaine sulcate", "Curseur rouge des marais" ].sort << "Race indéfinie"

  OTHER_RACE = ['Mouton', 'Chèvre', 'Poule', 'Dindon', 'Cochon', 'Oie' ].sort  << 'Autre espèce'

  HAIR = ['Sans poils', 'Ras', 'Court', 'Mi-long', 'Long']
  SIZE = ['Petit', 'Moyen', 'Grand']
  SEX = ['Femelle', 'Male']
  AGE = ['Bébé', 'Junior', 'Adulte', 'Sénior']
  # AGE = [[0..4, 'Bébé'], [5..12, 'Junior'], [13..96, 'Adulte'], [97..1000, 'Sénior']]

  NO_ESPECE = ['Selectionnez une espèce']

  COLOR = ["Abricot", "Albinos", "Alezan", "Arlequin", "Bai", "Beige", "Blanc", "Blanc avec marque noire", "Bleu et blanc", "Bleu merle", "Bringé", "Caramel", "Champagne", "Chocolat", "Chocolat et blanc", "Crème", "Ecaille de tortue", "Gauve ", "Fauve charbonné ", "Gris", "Gris et blanc", "Isabelle", "Marron", "Marron et blanc", "Marron caca", "Merle", "Noir", "Noir avec marque blanche", "Noir et Feu", "Noir et beige", "Noir et blanc", "Noir et gris", "Noir tri", "Pluricoloré", "Putoisé", "Rouge merle", "Rouge tri", "Roux", "Roux et blanc", "Sable", "Sanglier", "Seal point", "Tacheté", "Tigré", "Tigré blanc", "Tigré gris", "Tigré roux", "Tricolore" ].sort << "Couleur indéfinie"
  # ajouter un element au debut du array
  # .unshift("Choisir une couleur")

  YES_NO = [[false, 'Oui'], [true, 'Non']]

  ESPECE = ['Chat', 'Chien', 'Equidé', 'Rongeur', 'Furet', 'Oiseau', 'Reptile', 'Lapin' ].sort << 'Autre espèce'

  validates :name,          presence: true, length: { minimum: 3 }
  validates :description,   presence: true, length: { within: 1..1000 }
  validates :birth_date,    presence: true
  validates :espece,        presence: true #, inclusion: { in: Animal::ESPECE }
  validates :race,          presence: true   #, inclusion: { in: Animal::CAT_RACE }
  validates :sex,           presence: true #, inclusion: { in: Animal::SEX }
  # validates :hair,          presence: true, inclusion: { in: Animal::HAIR }

  validates :size,          presence: true #, inclusion: { in: Animal::SIZE }

  validates :color,         presence: true #, inclusion: { in: Animal::COLOR }
  validates :contact,       presence: true
  validates :host_name,     presence: true

  # def self.search(search)
  #   if search
  #     animals = Animal.all
  #     animals = Animal.where(sex: search[:":sex"][","])
  #     return animals
  #   else
  #     Animal.all
  #   end
  # end
end
