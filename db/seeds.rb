puts 'Destroying all selections'
Selection.destroy_all
puts 'Destroying all friendships'
Friendship.destroy_all
puts 'Destroying all users'
User.destroy_all
puts 'Destroying all restaurants'
Restaurant.destroy_all



# used_cuisines_array = ['Mexican', 'Italian', 'Asian-inspired', 'Vietnamese', 'Turkish', 'French']

puts 'Creating restaurants'
restaurants = [
  {
    name: 'Chupenga',
    address: 'Charlottenstrasse 4, Berlin',
    phone_number: '03025935148',
    cuisine: 'Mexican',
    url: 'https://www.chupenga.de/de_DE/',
    photo: 'ua3de8jus5dzcdwnd6zi',
  },
  {
    name: 'Charlotte 1',
    address: 'Charlottenstrasse 1, Berlin',
    phone_number: '',
    cuisine: 'Italian',
    url: '',
    photo: 'n4cuin35w5qvw3dstfnx',
  },
  {
    name: 'Tim Raue',
    address: 'Rudi-dutschke-straße 26, Berlin',
    phone_number: '03025937930',
    cuisine: 'Asian-inspired',
    url: 'https://tim-raue.com/en/',
    photo: 'brwibncc8gyu0laguxie',
  },
  {
    name: 'Monsieur Vuong',
    address: 'Alte Schönhauser Str. 46, Berlin',
    phone_number: '03099296924',
    cuisine: 'Vietnamese',
    url: 'https://www.monsieurvuong.de/en/',
    photo: 'tru72kzihecahjcgsg5s',
  },
  {
    name: 'Restaurant Babami',
    address: 'Zimmerstraße 23, Berlin',
    phone_number: '',
    cuisine: 'Vietnamese',
    url: 'https://www.monsieurvuong.de/en/',
    photo: 'hxcuf3qssmmlzatdpz2h',
  },
  {
    name: 'Viet Bowl Mitte',
    address: 'Zimmerstraße 69, Berlin',
    phone_number: '03020453712',
    cuisine: 'Vietnamese',
    url: 'https://www.vietbowl.de/mitte-viet-bowl',
    photo: 'llooz6sn4uorxkniqlj2',
  },
  {
    name: "Let's talk about juice!",
    address: 'Zimmerstraße 23, Berlin',
    phone_number: '03055476788',
    cuisine: 'Turkish',
    url: 'http://www.sevencoffee.de/',
    photo: 'pznb4boz851n2zfx0b4w',
  },
  {
    name: "Sale e Tabacchi",
    address: 'Rudi-Dutschke-Straße 25, Berlin',
    phone_number: '0302521155',
    cuisine: 'Italian',
    url: 'http://www.sale-e-tabacchi.de/',
    photo: 'x25kxmw9siqyho2uppn2',
  },
  {
    name: "Kori & Fay",
    address: 'Rudi-Dutschke-Straße 28, Berlin',
    phone_number: '03023628359',
    cuisine: 'Asian',
    url: 'http://koriandfay.de/',
    photo: 'hecf9uoqerlkvipgkmyf',
  },
  {
    name: "AVAN",
    address: 'Mauerstraße 81-82, Berlin',
    phone_number: '03023578730',
    cuisine: 'Vietnamese',
    url: 'https://avan.eatbu.com/?lang=en',
    photo: 'splygpq5spplw69f2fhc',
  },
  {
    name: "Entrecôte",
    address: ' Schützenstraße 5, Berlin',
    phone_number: '03020165496',
    cuisine: 'French',
    url: 'http://entrecote.de/',
    photo: 'mtdu6tqj6ywp9wlb7msj',
  },
  {
    name: "Barcelona Tapas Bar Restaurant",
    address: 'Friedrichstraße 211, Berlin',
    phone_number: '03070228336',
    cuisine: 'Spanish',
    url: 'https://barcelona-mitte.de/',
    photo: 'wdbtacjoxed08ce0iooe',
  },
  {
    name: "VAPIANO",
    address: 'Friedrichstraße 50-55, Berlin',
    phone_number: '03020607530',
    cuisine: 'Italian',
    url: 'https://de.vapiano.com/de/nc/restaurants/detail/restaurant-details/-529cc71a5f/',
    photo: 'qn4ggozb7fyllffg5qw',
  },
  {
    name: "House of Small Wonder",
    address: 'Johannisstraße 20, Berlin',
    cuisine: 'French',
    url: 'https://houseofsmallwonder.de/',
    photo: 'hgfcmoafuhjzgmv3xjut',
  }
  # {
  #   name: "",
  #   address: '',
  #   phone_number: '',
  #   cuisine: '',
  #   url: '',
  # }
]
Restaurant.create!(restaurants)
puts 'Done with restaurants'




puts 'Creating users'
users = [
  {
    name: 'Otto Jonetzki',
    email: 'otto@example.com',
    password: '123456',
    password_confirmation: '123456',
  },
  {
    name: 'Paul Ladwig',
    email: 'paul@example.com',
    password: '123456',
    password_confirmation: '123456',
  },
  {
    name: 'Marie Ladwig',
    email: 'marie@example.com',
    password: '123456',
    password_confirmation: '123456',
  },
  {
    name: 'Joris Kühnast',
    email: 'joris@example.com',
    password: '123456',
    password_confirmation: '123456',
  }
  # {
  #   name: '',
  #   email: '',
  #   password: '',
  #   password_confirmation: '',
  # }
]
User.create!(users)
puts 'Done with users'




puts 'Creating friendships'
friendships = [
  {
    asker: User.find_by(name: 'Otto Jonetzki'),
    receiver: User.find_by(name: 'Paul Ladwig')
  },
  {
    asker: User.find_by(name: 'Otto Jonetzki'),
    receiver: User.find_by(name: 'Marie Ladwig')
  },
  {
    asker: User.find_by(name: 'Otto Jonetzki'),
    receiver: User.find_by(name: 'Joris Kühnast')
  },
  {
    asker: User.find_by(name: 'Paul Ladwig'),
    receiver: User.find_by(name: 'Marie Ladwig')
  },
  {
    asker: User.find_by(name: 'Paul Ladwig'),
    receiver: User.find_by(name: 'Joris Kühnast')
  },
  {
    asker: User.find_by(name: 'Marie Ladwig'),
    receiver: User.find_by(name: 'Joris Kühnast')
  }
  # {
  #   asker: User.find_by(name: ''),
  #   receiver: User.find_by(name: '')
  # }
]
Friendship.create!(friendships)
puts 'Done with users'



puts 'Creating selections'
selections = [
  {
    user: User.find_by(name: 'Paul Ladwig'),
    occasion: 2,
    price: 1,
    review: 'Good restaurant with with low prices as well as competent and fast serviece! Perfect for a quick lunch with a small group of friends.',
    bookmarked: true,
    recommended: true,
    shared: true,
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Marie Ladwig'),
    occasion: 4,
    price: 4,
    review: 'The food was excellent with very fresh ingredients. Staff friendly and helpful. We will definitely be visiting again.',
    bookmarked: true,
    recommended: true,
    shared: true,
    restaurant: Restaurant.find_by(name: 'Tim Raue')
  },
  {
    user: User.find_by(name: 'Otto Jonetzki'),
    occasion: 2,
    price: 2,
    review: "I love Chupenga. They're remarkably fast, the food is consistent of quality, and they have amazing salsas / hotsauces. All for a decent price!",
    bookmarked: true,
    recommended: true,
    restaurant: Restaurant.find_by(name: 'Chupenga')
  },
  {
    user: User.find_by(name: 'Otto Jonetzki'),
    occasion: 2,
    price: 2,
    review: 'Good restaurant. The service is good, and the food was tasty. Reasonable prices as well.',
    bookmarked: true,
    recommended: true,
    shared: true,
    restaurant: Restaurant.find_by(name: 'Restaurant Babami')
  },
  {
    user: User.find_by(name: 'Otto Jonetzki'),
    occasion: 2,
    price: 2,
    review: 'Awesome food, fast and extremely friendly service and all for a low price!!',
    bookmarked: true,
    recommended: true,
    shared: true,
    special: true,
    proposed_date: DateTime.parse("18/12/2019 22:20:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Joris Kühnast'),
    occasion: 2,
    price: 2,
    review: "A warm, cosy place in Berlin. Place is quite small and usually very crowded but I loved the atmosphere there and the food was so delicious and reasonably priced. I'd recommend to anyone looking for some hearty, warm traditional Vietnamese dishes.",
    bookmarked: true,
    recommended: true,
    shared: true,
    special: true,
    restaurant: Restaurant.find_by(name: 'Monsieur Vuong')
  },
  {
    user: User.find_by(name: 'Marie Ladwig'),
    occasion: 2,
    price: 1,
    review: "Great food and low prices!!",
    bookmarked: true,
    recommended: true,
    shared: true,
    proposed_date: DateTime.parse("2019-02-12 21:00:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Paul Ladwig'),
    occasion: 2,
    price: 2,
    review: "One of the best vietnamese in the area.",
    bookmarked: true,
    restaurant: Restaurant.find_by(name: 'AVAN')
  },
  {
    user: User.find_by(name: 'Joris Kühnast'),
    occasion: 2,
    price: 2,
    review: "Great place for a quick dinner even with large groups",
    bookmarked: true,
    recommended: true,
    shared: true,
    proposed_date: DateTime.parse("01/12/2019 13:20:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Restaurant Babami')
  },
  {
    user: User.find_by(name: 'Joris Kühnast'),
    occasion: 2,
    price: 1,
    review: "One of the best price to value ratios I have ever seen!",
    bookmarked: true,
    recommended: true,
    shared: true,
    proposed_date: DateTime.parse("29/11/2019 13:00:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Otto Jonetzki'),
    occasion: 2,
    price: 2,
    review: "Ok for a qick lunch",
    bookmarked: true,
    restaurant: Restaurant.find_by(name: 'Viet Bowl Mitte')
  },
  {
    user: User.find_by(name: 'Marie Ladwig'),
    occasion: 2,
    price: 2,
    review: "I ate here twice when I visited Berlin. I like the food, the concept and the ambience. I ordered from the vegan menu, and it was extremely tasty! The vibe was really cool and chilled.",
    bookmarked: true,
    recommended: true,
    shared: true,
    restaurant: Restaurant.find_by(name: 'Chupenga')
  }
  # {
  #   user: User.find_by(name: ''),
  #   occasion: ,
  #   price: ,
  #   review: "",
  #   bookmarked: ,
  #   recommended: ,
  #   shared: ,
  #   special: ,
  #   proposed_date: DateTime.parse(""),
  #   restaurant: Restaurant.find_by(name: '')
  # }
]
Selection.create!(selections)
puts 'Done with selections'


puts 'Completed seeding process'
