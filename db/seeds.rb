puts 'Destroying all selections'
Selection.destroy_all
puts 'Destroying all friendships'
Friendship.destroy_all
puts 'Destroying all users'
User.destroy_all
puts 'Destroying all restaurants'
Restaurant.destroy_all


# add cuisine: "Other" to dropdown
cuisines_array = ['Italian', 'Asian-inspired', 'Vietnamese', 'German', 'Pizza', 'Fast Food',
  'Breakfast & Brunch', "Pan Asian", "Kebab", "Burgers", "Sushi Bars", "Mediterranean", "Indian", "Turkish",
  "Chinese", "Bakeries", "Coffee & Tea", "Thai", "Middle Eastern", "Greek", "Steakhouses", "French",
  "Patisserie / Cake Shop", "Vegan", "Sandwiches", "Modern European", "Ice Cream & Frozen Yogurt", "Korean",
  "Mexican", "Japanese", "Arabian", "Salad", "Vegetarian", "Barbeque", "Falafel", "Spanish", "Lebanese",
  "Austrian", "Seafood", "Soup", "Tapas", "American", "Buffets", "Creperies", "Waffles", "Asian Fusion", "Russian",
  "Argentine", "Latin American", "Wine Bars", "Cajun" , "Caribbean", "Moroccan", "Swedish", "Latvian", "Scottish",
  "British", "Russian", "Jewish", "Canadian", "Polish", "Hawaiian", "Brazilian", "Peruvian", "Salvadorian",
  "Cuban", "Tibetan", "Egyptian", "Belgian", "Irish", "Welsh", "Mormon", "Portuguese", "Haitian",
  "Tahitian", "Kenyan", "Algerian", "Nigerian", "Libyan"]

puts 'Creating restaurants'
restaurants = [
  {
    name: 'Chupenga',
    address: 'Charlottenstrasse 4, Berlin',
    phone_number: '03025935148',
    cuisine: 'Mexican',
    url: 'https://www.chupenga.de/de_DE/',
    email: 'mail@chupenga.com',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776728/ua3de8jus5dzcdwnd6zi.jpg"
  },
  {
    name: 'Charlotte 1',
    address: 'Charlottenstrasse 1, Berlin',
    phone_number: '',
    cuisine: 'Italian',
    url: '',
    email: '',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776713/n4cuin35w5qvw3dstfnx.jpg",
  },
  {
    name: 'Tim Raue',
    address: 'Rudi-dutschke-straße 26, Berlin',
    phone_number: '03025937930',
    cuisine: 'Asian-inspired',
    url: 'https://tim-raue.com/en/',
    email: 'office@tim-raue.com',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776846/brwibncc8gyu0laguxie.jpg",
  },
  {
    name: 'Monsieur Vuong',
    address: 'Alte Schönhauser Str. 46, Berlin',
    phone_number: '03099296924',
    cuisine: 'Vietnamese',
    url: 'https://www.monsieurvuong.de/en/',
    email: 'indochina@monsieurvuong.de',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776810/tru72kzihecahjcgsg5s.jpg",
  },
  {
    name: 'Restaurant Babami',
    address: 'Zimmerstraße 23, Berlin',
    phone_number: '',
    cuisine: 'Vietnamese',
    url: 'https://www.monsieurvuong.de/en/',
    email: '',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776684/hxcuf3qssmmlzatdpz2h.jpg",
  },
  {
    name: 'Viet Bowl Mitte',
    address: 'Zimmerstraße 69, Berlin',
    phone_number: '03020453712',
    cuisine: 'Vietnamese',
    url: 'https://www.vietbowl.de/mitte-viet-bowl',
    email: 'info@vietbowl.de',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776891/llooz6sn4uorxkniqlj2.jpg",
  },
  {
    name: "Let's talk about juice!",
    address: 'Zimmerstraße 23, Berlin',
    phone_number: '03055476788',
    cuisine: 'Turkish',
    url: 'http://www.sevencoffee.de/',
    email: '',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776794/pznb4boz851n2zfx0b4w.jpg",
  },
  {
    name: "Sale e Tabacchi",
    address: 'Rudi-Dutschke-Straße 25, Berlin',
    phone_number: '0302521155',
    cuisine: 'Italian',
    url: 'http://www.sale-e-tabacchi.de/',
    email: 'mail@sale-e-tabacchi.de',
    remote_photo_url: "https://images.unsplash.com/photo-1473093226795-af9932fe5856?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=985&q=80",
  },
  {
    name: "Kori & Fay",
    address: 'Rudi-Dutschke-Straße 28, Berlin',
    phone_number: '03023628359',
    cuisine: 'Asian',
    url: 'http://koriandfay.de/',
    email: 'info@koriandfay.de',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776774/hecf9uoqerlkvipgkmyf.jpg",
  },
  {
    name: "AVAN",
    address: 'Mauerstraße 81-82, Berlin',
    phone_number: '03023578730',
    cuisine: 'Vietnamese',
    url: 'https://avan.eatbu.com/?lang=en',
    email: 'thai.thi.thanh83@gmail.com',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776659/splygpq5spplw69f2fhc.jpg",
  },
  {
    name: "Entrecôte",
    address: ' Schützenstraße 5, Berlin',
    phone_number: '03020165496',
    cuisine: 'French',
    url: 'http://entrecote.de/',
    email: 'info@entrecote.de',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776741/mtdu6tqj6ywp9wlb7msj.jpg",
  },
  {
    name: "Barcelona Tapas Bar Restaurant",
    address: 'Friedrichstraße 211, Berlin',
    phone_number: '03070228336',
    cuisine: 'Spanish',
    url: 'https://barcelona-mitte.de/',
    email: 'info@barcelona.berlin',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776700/wdbtacjoxed08ce0iooe.jpg",
  },
  {
    name: "VAPIANO",
    address: 'Friedrichstraße 50-55, Berlin',
    phone_number: '03020607530',
    cuisine: 'Italian',
    url: 'https://de.vapiano.com/de/nc/restaurants/detail/restaurant-details/-529cc71a5f/',
    email: 'info@vapiano.de',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776877/aqn4ggozb7fyllffg5qw.jpg",
  },
  {
    name: "House of Small Wonder",
    address: 'Johannisstraße 20, Berlin',
    cuisine: 'French',
    url: 'https://houseofsmallwonder.de/',
    email: 'info@houseofsmallwonder.de',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776760/hgfcmoafuhjzgmv3xjut.jpg",
  },
  {
    name: "I Due Forni",
    address: 'Schönhauser Allee 12, 10119 Berlin',
    cuisine: 'Italian',
    url: 'https://www.facebook.com/pages/I-Due-Forni/154460154586282',
    phone_number: '030 44017333',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574951884/photo-1528137871618-79d2761e3fd5_gqnsca.jpg",
  },
  {
    name: "QUA PHE",
    address: 'Max-Beer-Straße 37, 10119 Berlin',
    cuisine: 'Vietnamese',
    url: 'https://www.facebook.com/QuaPheBerlin/',
    phone_number: '030 97005479',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574949646/66332841_2373009932915489_8626682284939935744_o.jpg_gilysd.jpg",
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
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574790595/duh9ek7hpkyd1tuzb5h9.jpg",
    password: '123456',
    password_confirmation: '123456',
    location: 'Hamburg, Germany',
    username: 'otto_jonetzki',
    description: 'Some eat to live but I live to eat!!'
  },
  {
    name: 'Paul Ladwig',
    email: 'paul@example.com',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574790606/bp6rt2iolgzazszuuzyy.jpg",
    password: '123456',
    password_confirmation: '123456',
    location: 'Stuttgart, Germany',
    username: 'paul_ladwig',
    description: 'Hipster-friendly Italian cuisine fanatic. General beer specialist. Creator. Food lover.'
  },
  {
    name: 'Marie Ladwig',
    email: 'marie@example.com',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574790580/ny0rfdfbldyjrkvlherr.jpg",
    password: '123456',
    password_confirmation: '123456',
    location: 'Stuttgart, Germany',
    username: 'marie_ladwig',
    description: "Total food aficionado. Reader. Love traditional Japanese cuisine. Professional travel lover."
  },
  {
    name: 'Joris Kühnast',
    email: 'joris@example.com',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574790615/bticdxmbk8hxwbqhh5uk.jpg",
    password: '123456',
    password_confirmation: '123456',
    location: 'Frankfurt am Main, Germany',
    username: 'joris_kuehnast',
    description: "Coffee fanatic. Amateur food critic. Junior developer."
  },
  {
    name: 'Frank Maier',
    email: 'frank@example.com',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574949292/photo-1544723795-3fb6469f5b39_pl0lde.jpg",
    password: '123456',
    password_confirmation: '123456',
    location: 'Mainz, Germany',
    username: 'frank_maier',
    description: "Award-winning alcohol practitioner. Passionate food expert."
  },
  {
    name: 'John Hausmann',
    email: 'john@example.com',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574949357/photo-1544098485-2a2ed6da40ba_qsjxmt.jpg",
    password: '123456',
    password_confirmation: '123456',
    location: 'München, Germany',
    username: 'john_hausmann',
    description: "Food fan. Lifelong problem solver. Communicator. Organizer. Twitter buff. Total bacon enthusiast. Wannabe beer geek."
  },
  {
    name: 'Samantha Jonathan',
    email: 'Samantha@example.com',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574949967/photo-1541943181603-d8fe267a5dcf_u8xcb5.jpg",
    password: '123456',
    password_confirmation: '123456',
    location: 'Dortmund, Germany',
    username: 'samantha_jonathan',
    description: "I simply love foor!"
  },
  {
    name: 'James Gibson',
    email: 'James@example.com',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574951134/photo-1541647376583-8934aaf3448a_mnsqzu.jpg",
    password: '123456',
    password_confirmation: '123456',
    location: 'Berlin, Germany',
    username: 'james_gibson',
    description: "By the time I die I want to have eaten every seciality from every country"
  },
  {
    name: 'Janis Sidenburg',
    email: 'janis@example.com',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574951671/photo-1548946526-f69e2424cf45_djcoxl.jpg",
    password: '123456',
    password_confirmation: '123456',
    location: 'Hannover, Germany',
    username: 'janis_sidenburg',
  },
  {
    name: 'Johanna Frenche',
    email: 'johanna@example.com',
    remote_photo_url: "https://images.unsplash.com/photo-1428931996691-a5108d4cdbf5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80",
    password: '123456',
    password_confirmation: '123456',
    location: 'Bremen, Germany',
    username: 'johanna_frenche',
    description: "Alcoholaholic. Lifelong beer aficionado. Coffee scholar. Student. Subtly charming internet fanatic."
  },
  {
    name: 'Lisa Maibach',
    email: 'lisa@example.com',
    remote_photo_url: "https://images.unsplash.com/photo-1528914457842-1af67b57139d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    password: '123456',
    password_confirmation: '123456',
    location: 'Muenster, Germany',
    username: 'lisa_mai',
  },
  {
    name: 'Viete Leker',
    email: 'viete@example.com',
    remote_photo_url: "https://images.unsplash.com/photo-1566807810030-3eaa60f3e670?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80",
    password: '123456',
    password_confirmation: '123456',
    location: 'Potsdam, Germany',
    username: 'vl1235',
  },
  {
    name: 'Charlotte Bremer',
    email: 'charlotte@example.com',
    remote_photo_url: "https://images.unsplash.com/photo-1499952127939-9bbf5af6c51c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2110&q=80",
    password: '123456',
    password_confirmation: '123456',
    location: 'Berlin, Germany',
    username: 'Charly88',
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
    asker: User.find_by(name: 'Paul Ladwig'),
    receiver: User.find_by(name: 'Otto Jonetzki')
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
    asker: User.find_by(name: 'Joris Kühnast'),
    receiver: User.find_by(name: 'Otto Jonetzki')
  },
  {
    asker: User.find_by(name: 'Paul Ladwig'),
    receiver: User.find_by(name: 'Marie Ladwig')
  },
  {
    asker: User.find_by(name: 'Marie Ladwig'),
    receiver: User.find_by(name: 'Paul Ladwig')
  },
  {
    asker: User.find_by(name: 'Paul Ladwig'),
    receiver: User.find_by(name: 'Joris Kühnast')
  },
  {
    asker: User.find_by(name: 'Marie Ladwig'),
    receiver: User.find_by(name: 'Joris Kühnast')
  },
  {
    asker: User.find_by(name: 'Paul Ladwig'),
    receiver: User.find_by(name: 'John Hausmann')
  },
  {
    asker: User.find_by(name: 'Paul Ladwig'),
    receiver: User.find_by(name: 'Janis Sidenburg')
  },
  {
    asker: User.find_by(name: 'Paul Ladwig'),
    receiver: User.find_by(name: 'James Gibson')
  },
  {
    asker: User.find_by(name: 'Lisa Maibach'),
    receiver: User.find_by(name: 'James Gibson')
  },
  {
    asker: User.find_by(name: 'James Gibson'),
    receiver: User.find_by(name: 'Lisa Maibach')
  },
  {
    asker: User.find_by(name: 'Lisa Maibach'),
    receiver: User.find_by(name: 'Paul Ladwig')
  },
  {
    asker: User.find_by(name: 'Paul Ladwig'),
    receiver: User.find_by(name: 'Lisa Maibach')
  },
  {
    asker: User.find_by(name: 'Lisa Maibach'),
    receiver: User.find_by(name: 'John Hausmann')
  },
  {
    asker: User.find_by(name: 'John Hausmann'),
    receiver: User.find_by(name: 'Lisa Maibach')
  },
  {
    asker: User.find_by(name: 'Lisa Maibach'),
    receiver: User.find_by(name: 'Joris Kühnast')
  },
  {
    asker: User.find_by(name: 'Joris Kühnast'),
    receiver: User.find_by(name: 'Lisa Maibach')
  },
   {
    asker: User.find_by(name: 'Johanna Frenche'),
    receiver: User.find_by(name: 'Joris Kühnast')
  },
  {
    asker: User.find_by(name: 'Joris Kühnast'),
    receiver: User.find_by(name: 'Johanna Frenche')
  },
   {
    asker: User.find_by(name: 'John Hausmann'),
    receiver: User.find_by(name: 'Joris Kühnast')
  },
  {
    asker: User.find_by(name: 'Joris Kühnast'),
    receiver: User.find_by(name: 'Janis Sidenburg')
  },
   {
    asker: User.find_by(name: 'James Gibson'),
    receiver: User.find_by(name: 'Joris Kühnast')
  },
  {
    asker: User.find_by(name: 'Joris Kühnast'),
    receiver: User.find_by(name: 'James Gibson')
  },
  {
    asker: User.find_by(name: 'Frank Maier'),
    receiver: User.find_by(name: 'James Gibson')
  },
  {
    asker: User.find_by(name: 'James Gibson'),
    receiver: User.find_by(name: 'Frank Maier')
  },
  {
    asker: User.find_by(name: 'Frank Maier'),
    receiver: User.find_by(name: 'Paul Ladwig')
  },
  {
    asker: User.find_by(name: 'Frank Maier'),
    receiver: User.find_by(name: 'Lisa Maibach')
  },
  {
    asker: User.find_by(name: 'Frank Maier'),
    receiver: User.find_by(name: 'John Hausmann')
  },
  {
    asker: User.find_by(name: 'John Hausmann'),
    receiver: User.find_by(name: 'Frank Maier')
  },
  {
    asker: User.find_by(name: 'Frank Maier'),
    receiver: User.find_by(name: 'Joris Kühnast')
  },
  {
    asker: User.find_by(name: 'Frank Maier'),
    receiver: User.find_by(name: 'Marie Ladwig')
  },{
    asker: User.find_by(name: 'Paul Ladwig'),
    receiver: User.find_by(name: 'Charlotte Bremer')
  },{
    asker: User.find_by(name: 'Paul Ladwig'),
    receiver: User.find_by(name: 'Viete Leker')
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
    bookmarked: false,
    recommended: true,
    shared: true,
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Marie Ladwig'),
    occasion: 4,
    price: 4,
    review: 'The food was excellent with very fresh ingredients. Staff friendly and helpful. We will definitely be visiting again.',
    bookmarked: false,
    recommended: true,
    shared: true,
    restaurant: Restaurant.find_by(name: 'Tim Raue')
  },
  {
    user: User.find_by(name: 'Otto Jonetzki'),
    occasion: 2,
    price: 2,
    review: "I love Chupenga. They're remarkably fast, the food is consistent of quality, and they have amazing salsas / hotsauces. All for a decent price!",
    bookmarked: false,
    recommended: true,
    restaurant: Restaurant.find_by(name: 'Chupenga')
  },
  {
    user: User.find_by(name: 'Otto Jonetzki'),
    occasion: 2,
    price: 2,
    review: 'Good restaurant. The service is good, and the food was tasty. Reasonable prices as well.',
    bookmarked: false,
    recommended: true,
    shared: true,
    restaurant: Restaurant.find_by(name: 'Restaurant Babami')
  },
  {
    user: User.find_by(name: 'Otto Jonetzki'),
    occasion: 2,
    price: 2,
    review: 'Awesome food, fast and extremely friendly service and all for a low price!!',
    bookmarked: false,
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
    bookmarked: false,
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
    bookmarked: false,
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
    bookmarked: false,
    recommended: true,
    restaurant: Restaurant.find_by(name: 'AVAN')
  },
  {
    user: User.find_by(name: 'Joris Kühnast'),
    occasion: 2,
    price: 2,
    review: "Great place for a quick dinner even with large groups",
    bookmarked: false,
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
    bookmarked: false,
    recommended: true,
    shared: true,
    proposed_date: DateTime.parse("29/11/2019 13:00:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Otto Jonetzki'),
    occasion: 2,
    price: 2,
    review: "Ok for a qick lunch but I would not go here for dinner, mostly because of the atmosphere!",
    recommended: true,
    restaurant: Restaurant.find_by(name: 'Viet Bowl Mitte')
  },
  {
    user: User.find_by(name: 'Marie Ladwig'),
    occasion: 2,
    price: 2,
    review: "I ate here twice when I visited Berlin. I like the food, the concept and the ambience. I ordered from the vegan menu, and it was extremely tasty! The vibe was really cool and chilled.",
    recommended: true,
    shared: true,
    restaurant: Restaurant.find_by(name: 'Chupenga')
  },
  {
    user: User.find_by(name: 'Joris Kühnast'),
    bookmarked: true,
    shared: false,
    restaurant: Restaurant.find_by(name: 'Chupenga')
  },
  {
    user: User.find_by(name: 'John Hausmann'),
    occasion: 2,
    price: 2,
    review: "Really tasty pizza and the place is just cool in general super chill vibe and theerefore ideal for lunch or a casuel dinner.",
    recommended: true,
    shared: false,
    restaurant: Restaurant.find_by(name: 'I Due Forni')
  },
  {
    user: User.find_by(name: 'John Hausmann'),
    occasion: 2,
    price: 2,
    review: "I have been going here since they opened in early last year. Its really good and has never dissapointed me, feew can claim that. No matter what you will get you will be satisfied!",
    recommended: true,
    shared: true,
    restaurant: Restaurant.find_by(name: 'QUA PHE')
  },
  {
    user: User.find_by(name: 'Samantha Jonathan'),
    occasion: 2,
    price: 2,
    review: "Quiet restaurant with good and not very expensive food. They have mainly polish specialites. The restaurant is nice inside and has very pleasant garden.",
    recommended: true,
    shared: true,
    restaurant: Restaurant.find_by(name: 'QUA PHE')
  },
  {
    user: User.find_by(name: 'James Gibson'),
    occasion: 2,
    price: 2,
    review: "This is the best quality, real Italian pizza you can get in Barcelona! Its rare to find good pizza like this restaurant in a touristic town but it’s worth the trip if you don’t live in the area. The shaft is adorable absolutely amazing sweet people. I would highly recommend this spot! Don’t forget to book online cos there might not be a spot if you arrive without a booking.",
    recommended: true,
    shared: true,
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Samantha Jonathan'),
    occasion: 2,
    price: 2,
    review: "We had the most wonderful pizzas here - thoroughly recommend the Piemonte. Never had anything like it. Fantastic service and wonderful reasonably priced wine. So glad we found this place.",
    recommended: true,
    shared: true,
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Janis Sidenburg'),
    occasion: 2,
    price: 2,
    review: "Visited on a Sunday evening and managed to get a seat upstairs. Beautiful pizza, wine and service. A real gem and reasonably priced. If you like pizza then you must pay a visit!",
    recommended: true,
    shared: false,
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Frank Maier'),
    occasion: 1,
    price: 1,
    review: "In my opinion, this is by far the best place for lunch close to Checkpoint Charlie. The pizza is delicious, always fresh and with good ingredients. Makes lunch feel like a trip to Italy!",
    recommended: true,
    shared: false,
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Frank Maier'),
    occasion: 2,
    price: 2,
    review: "Very good for lunch, especially if you are hungry. Fresh burritos with ingredients (e.g., lentils) you don't get elsewhere. Especially good for vegetarians!",
    recommended: true,
    shared: false,
    restaurant: Restaurant.find_by(name: 'Chupenga')
  },
  {
    user: User.find_by(name: 'Frank Maier'),
    occasion: 2,
    price: 2,
    review: "Very good Asian food! Even my friends from Vietnam go here a lot! My favourite is the green curry.",
    recommended: true,
    shared: false,
    restaurant: Restaurant.find_by(name: 'QUA PHE')
  },
  {
    user: User.find_by(name: 'Frank Maier'),
    bookmarked: true,
    restaurant: Restaurant.find_by(name: 'I Due Forni')
  },
   {
    user: User.find_by(name: 'Frank Maier'),
    bookmarked: true,
    restaurant: Restaurant.find_by(name: 'House of Small Wonder')
  },
    {
    user: User.find_by(name: 'Lisa Maibach'),
    bookmarked: true,
    restaurant: Restaurant.find_by(name: 'House of Small Wonder')
  },
   {
    user: User.find_by(name: 'Joris Kühnast'),
    bookmarked: true,
    restaurant: Restaurant.find_by(name: 'Viet Bowl Mitte')
  },
    {
    user: User.find_by(name: 'Janis Sidenburg'),
    bookmarked: true,
    restaurant: Restaurant.find_by(name: "Let's talk about juice!")
  },
    {
    user: User.find_by(name: 'Janis Sidenburg'),
    bookmarked: true,
    restaurant: Restaurant.find_by(name: "Sale e Tabacchi")
  },
  {
    user: User.find_by(name: 'Viete Leker'),
    occasion: 2,
    price: 1,
    review: "Very tasty and fresh tapas. Soft bottom with so fresh ingredients and vegetables. Very kind lady serving tapas which are cheap, so I really recommend this place.",
    bookmarked: false,
    recommended: true,
    shared: true,
    proposed_date: DateTime.parse("29/11/2019 13:00:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Barcelona Tapas Bar Restaurant')
  },
  {
    user: User.find_by(name: 'Frank Maier'),
    occasion: 2,
    price: 1,
    review: "On my second trip to Berlin I was looking forward to eating here again. The food selection and atmosphere is as good as it gets!! There is a great buzz and the staff are very helpful and friendly.
I was unfortunate enough to lose my phone. I re-traced my steps the next day not being very optimistic ... however I was very pleasantly surprised. One of the lovely young ladies working there had found it outside the door and had it in safe keeping for me. A true sign of very good staff.
If visiting Berlin make sure to visit, you won’t be disappointed.",
    bookmarked: false,
    recommended: true,
    shared: true,
    proposed_date: DateTime.parse("29/11/2019 13:00:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Barcelona Tapas Bar Restaurant')
  },
  {
    user: User.find_by(name: 'John Hausmann'),
    occasion: 2,
    price: 1,
    review: "Great location with lots of possibilities to move on to other bars. Food was good. Wine was good. Tapas were a bit pricy but quality is excellent.",
    bookmarked: false,
    recommended: true,
    shared: true,
    proposed_date: DateTime.parse("29/11/2019 13:00:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Barcelona Tapas Bar Restaurant')
  },
  {
    user: User.find_by(name: 'Charlotte Bremer'),
    occasion: 2,
    price: 1,
    review: "Great location with lots of possibilities to move on to other bars. Food was good. Wine was good. Tapas were a bit pricy but quality is excellent.",
    bookmarked: false,
    recommended: true,
    shared: true,
    proposed_date: DateTime.parse("29/11/2019 13:00:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Sale e Tabacchi')
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

puts 'add additional friendhips'

puts 'Creating friendships'
add_friendships = [
  {
    asker: User.find_by(name: 'Otto Jonetzki'),
    receiver: User.find_by(name: 'Viete Leker')
  },
  {
    asker: User.find_by(name: 'Paul Ladwig'),
    receiver: User.find_by(name: 'Viete Leker')
  },
  {
    asker: User.find_by(name: 'Viete Leker'),
    receiver: User.find_by(name: 'Marie Ladwig')
  },
  {
    asker: User.find_by(name: 'Viete Leker'),
    receiver: User.find_by(name: 'Joris Kühnast')
  },
  {
    asker: User.find_by(name: 'Viete Leker'),
    receiver: User.find_by(name: 'Paul Ladwig')
  },
  {
    asker: User.find_by(name: 'Viete Leker'),
    receiver: User.find_by(name: 'Otto Jonetzki')
  }
  # {
  #   asker: User.find_by(name: ''),
  #   receiver: User.find_by(name: '')
  # }
]
Friendship.create!(add_friendships)

puts "additional friendships created"

puts "additional review"

Selection.create(user: User.find_by(name: "Lisa Maibach"), recommended: true, restaurant: Restaurant.find_by(name: "Charlotte 1"), review: "I really love this restaurant. I could come here every day and I always bring my colleagues. The pizza is delicious and so is the pasta. My favourite is the pizza parma though.", occasion: 1, price: 1)

puts "additional review dones"

puts 'Completed seeding process'
