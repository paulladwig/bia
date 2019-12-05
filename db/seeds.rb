puts 'Destroying all selections'
Selection.destroy_all
puts 'Destroying all friendships'
Friendship.destroy_all
puts 'Destroying all users'
User.destroy_all
puts 'Destroying all restaurants'
Restaurant.destroy_all

puts 'Creating restaurants'
restaurants = [
  {
    name: 'Chupenga',
    address: 'Charlottenstrasse 4, Berlin',
    phone_number: '030 25935148',
    cuisine: 'Mexican',
    url: 'https://www.chupenga.de/de_DE/',
    email: 'mail@chupenga.com',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776728/ua3de8jus5dzcdwnd6zi.jpg",
    placeid: "ChIJ57L_o9ZRqEcRaTUSjMQitXY",
  },
  {
    name: 'Charlotte 1',
    address: 'Charlottenstrasse 1, Berlin',
    cuisine: 'Italian',
    url: '',
    email: '',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776713/n4cuin35w5qvw3dstfnx.jpg",
    placeid: "ChIJG3e2FdRRqEcRx0GBFAr-ivE"
  },
  {
    name: 'Tim Raue',
    address: 'Rudi-Dutschke-Straße 26, Berlin',
    phone_number: '030 25937930',
    cuisine: 'Asian Fusion',
    url: 'https://tim-raue.com/en/',
    email: 'office@tim-raue.com',
    remote_photo_url: "https://images.unsplash.com/photo-1523218392679-568e996fde65?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    placeid: "ChIJpdyYVNFRqEcRFTrYsDXDrY4",
  },
  {
    name: 'Monsieur Vuong',
    address: 'Alte Schönhauser Str. 46, Berlin',
    phone_number: '030 99296924',
    cuisine: 'Vietnamese',
    url: 'https://www.monsieurvuong.de/en/',
    email: 'indochina@monsieurvuong.de',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776810/tru72kzihecahjcgsg5s.jpg",
    placeid: "ChIJl_b_HuJRqEcRBlMB13SVyzg",
  },
  {
    name: 'Restaurant Babami',
    address: 'Zimmerstraße 23, Berlin',
    cuisine: 'Vietnamese',
    url: 'https://www.monsieurvuong.de/en/',
    email: '',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776684/hxcuf3qssmmlzatdpz2h.jpg",
    placeid: "ChIJ9fmURdFRqEcRyvz-X__9AII",
  },
  {
    name: 'Viet Bowl Mitte',
    address: 'Zimmerstraße 69, Berlin',
    phone_number: '030 20453712',
    cuisine: 'Vietnamese',
    url: 'https://www.vietbowl.de/mitte-viet-bowl',
    email: 'info@vietbowl.de',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776891/llooz6sn4uorxkniqlj2.jpg",
    placeid: "",
  },
  {
    name: "Let's talk about juice!",
    address: 'Zimmerstraße 23, Berlin',
    phone_number: '030 55476788',
    cuisine: 'Turkish',
    url: 'http://www.sevencoffee.de/',
    email: '',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776794/pznb4boz851n2zfx0b4w.jpg",
    placeid: "",
  },
  {
    name: "Sale e Tabacchi",
    address: 'Rudi-Dutschke-Straße 25, Berlin',
    phone_number: '030 2521155',
    cuisine: 'Italian',
    url: 'http://www.sale-e-tabacchi.de/',
    email: 'mail@sale-e-tabacchi.de',
    remote_photo_url: "https://images.unsplash.com/photo-1473093226795-af9932fe5856?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=985&q=80",
    placeid: "ChIJCYBSVNFRqEcR6x9hA_gZsQc",
  },
  {
    name: "Kori & Fay",
    address: 'Rudi-Dutschke-Straße 28, Berlin',
    phone_number: '030 23628359',
    cuisine: 'Asian',
    url: 'http://koriandfay.de/',
    email: 'info@koriandfay.de',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776774/hecf9uoqerlkvipgkmyf.jpg",
    placeid: "ChIJrZB0WdFRqEcR9uklmCvf7GA",
  },
  {
    name: "AVAN",
    address: 'Mauerstraße 81-82, Berlin',
    phone_number: '030 23578730',
    cuisine: 'Vietnamese',
    url: 'https://avan.eatbu.com/?lang=en',
    email: 'thai.thi.thanh83@gmail.com',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776659/splygpq5spplw69f2fhc.jpg",
    placeid: "ChIJ_74CF9BRqEcRpJGMKTuWhr4",
  },
  {
    name: "Entrecôte",
    address: ' Schuetzenstraße 5, Berlin',
    phone_number: '030 20165496',
    cuisine: 'French',
    url: 'http://entrecote.de/',
    email: 'info@entrecote.de',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776741/mtdu6tqj6ywp9wlb7msj.jpg",
    placeid: "",
  },
  {
    name: "Barcelona Tapas Bar Restaurant",
    address: 'Friedrichstraße 211, Berlin',
    phone_number: '030 70228336',
    cuisine: 'Spanish',
    url: 'https://barcelona-mitte.de/',
    email: 'info@barcelona.berlin',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776700/wdbtacjoxed08ce0iooe.jpg",
    placeid: "ChIJt4wn5NNRqEcReBWoQd7qjqg",
  },
  {
    name: "VAPIANO",
    address: 'Friedrichstraße 50-55, Berlin',
    phone_number: '030 20607530',
    cuisine: 'Italian',
    url: 'https://de.vapiano.com/de/nc/restaurants/detail/restaurant-details/-529cc71a5f/',
    email: 'info@vapiano.de',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776877/aqn4ggozb7fyllffg5qw.jpg",
    placeid: "ChIJE0eMENFRqEcRsJOe5RO6V-Q",
  },
  {
    name: "House of Small Wonder",
    address: 'Johannisstraße 20, Berlin',
    cuisine: 'French',
    url: 'https://houseofsmallwonder.de/',
    email: 'info@houseofsmallwonder.de',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574776760/hgfcmoafuhjzgmv3xjut.jpg",
    placeid: "ChIJfSfTtelRqEcRC52WM-fWJi8",
  },
  {
    name: "I Due Forni",
    address: 'Schönhauser Allee 12, 10119 Berlin',
    cuisine: 'Italian',
    url: 'https://www.facebook.com/pages/I-Due-Forni/154460154586282',
    phone_number: '030 44017333',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574951884/photo-1528137871618-79d2761e3fd5_gqnsca.jpg",
    placeid: "ChIJDaDDUR1OqEcRLZ4_j3Ag4BY",
  },
  {
    name: "QUA PHE",
    address: 'Max-Beer-Straße 37, 10119 Berlin',
    cuisine: 'Vietnamese',
    url: 'https://www.facebook.com/QuaPheBerlin/',
    phone_number: '030 97005479',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574949646/66332841_2373009932915489_8626682284939935744_o.jpg_gilysd.jpg",
    placeid: "ChIJR4q9-eFRqEcRGDbRkN28LxQ",
  },
  {
    name: "Mama Cook",
    address: 'Hedemannstraße 10,10969 Berlin',
    phone_number: '030 25927121',
    cuisine: 'Vietnamese',
    url: 'https://mama-cook.de/',
    remote_photo_url: "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80",
    placeid: "ChIJWS9JatNRqEcRABpjSZmGpXo",
  },
  {
    name: "Shi-Mai",
    address: 'Karl-Liebknecht-Straße 5 DomAquarée, 10178 Berlin',
    phone_number: '030 40054883',
    cuisine: 'Vietnamese',
    url: 'http://www.shi-mai.com/',
    remote_photo_url: "https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1867&q=80",
    placeid: "ChIJLTX2ud9RqEcRSRGoGNV6Sx8",
  },
  {
    name: "Otito Vietnamese Food",
    address: 'Leipziger Str. 30, 10117 Berlin',
    phone_number: '030 20605300',
    cuisine: 'Vietnamese',
    url: 'http://www.otito.de/',
    remote_photo_url: "https://images.unsplash.com/photo-1498654896293-37aacf113fd9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80",
    placeid: "ChIJr3FiUNBRqEcRW-2xZuTrL3M",
  },
  {
    name: "Linh Linh",
    address: 'Stresemannstraße 105, 10963 Berlin',
    phone_number: '030 26101607',
    cuisine: 'Vietnamese',
    remote_photo_url: "https://images.unsplash.com/photo-1485182708500-e8f1f318ba72?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1985&q=80",
    placeid: "ChIJg_ncTMxRqEcRx8f-vvws-i0",
  },
  {
    name: "Ngon Restaurant Berlin",
    address: 'Rathausstraße 23, 10178 Berlin',
    phone_number: '0174 1923359',
    cuisine: 'Vietnamese',
    remote_photo_url: "https://images.unsplash.com/photo-1548029960-695d127f4543?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
    placeid: "ChIJN200oCBOqEcRRVxtZuPAMbA",
  },
  {
    name: "Madami",
    address: 'Rosa-Luxemburg-Straße 3, 10178 Berlin',
    phone_number: '030 65779266',
    cuisine: 'Vietnamese',
    url: 'http://www.madami-restaurant.de/',
    remote_photo_url: "https://images.unsplash.com/photo-1551632436-cbf8dd35adfa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80",
    placeid: "ChIJOT7j0R9OqEcRDQKqIivIJj4",
  },
  {
    name: "Chicha",
    address: 'Friedelstraße 34, 12047 Berlin',
    phone_number: '030 62731010',
    cuisine: 'Peruvian',
    url: 'http://www.chicha-berlin.de/',
    remote_photo_url: "https://images.unsplash.com/photo-1484980972926-edee96e0960d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    placeid: "ChIJAYEjS7RPqEcRTBMvMrMFsck",
  },
  {
    name: "Cevicheria",
    address: 'Dresdener Str. 120, 10999 Berlin',
    phone_number: '030 55624038',
    cuisine: 'Peruvian',
    url: 'http://cevicheria-berlin.com/',
    remote_photo_url: "https://images.unsplash.com/reserve/oMRKkMc4RSq7N91OZl0O_IMG_8309.jpg?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    placeid: "ChIJ5x9cqzNOqEcRNqsdhEOOV2E",
  },
  {
    name: "NAUTA Berlín",
    address: 'Kastanienallee 49, 10119 Berlin',
    phone_number: '0174 3863466',
    cuisine: 'Peruvian',
    url: 'http://www.nautaberlin.com/',
    remote_photo_url: "https://images.unsplash.com/photo-1508471349025-ca3e278cf5e2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    placeid: "ChIJz0O_ZPtRqEcR86r1Hj-vBQw",
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
    location: 'Berlin, Germany',
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
    name: 'Joris Kuehnast',
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
    username: 'frank_maier',
    description: "Award-winning alcohol practitioner. Passionate food expert."
  },
  {
    name: 'John Hausmann',
    email: 'john@example.com',
    remote_photo_url: "https://res.cloudinary.com/bia-app/image/upload/v1574949357/photo-1544098485-2a2ed6da40ba_qsjxmt.jpg",
    password: '123456',
    password_confirmation: '123456',
    location: 'Muenchen, Germany',
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
    receiver: User.find_by(name: 'Joris Kuehnast')
  },
  {
    asker: User.find_by(name: 'Joris Kuehnast'),
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
    receiver: User.find_by(name: 'Joris Kuehnast')
  },
  {
    asker: User.find_by(name: 'Marie Ladwig'),
    receiver: User.find_by(name: 'Joris Kuehnast')
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
    receiver: User.find_by(name: 'Joris Kuehnast')
  },
  {
    asker: User.find_by(name: 'Joris Kuehnast'),
    receiver: User.find_by(name: 'Lisa Maibach')
  },
   {
    asker: User.find_by(name: 'Johanna Frenche'),
    receiver: User.find_by(name: 'Joris Kuehnast')
  },
  {
    asker: User.find_by(name: 'Joris Kuehnast'),
    receiver: User.find_by(name: 'Johanna Frenche')
  },
   {
    asker: User.find_by(name: 'John Hausmann'),
    receiver: User.find_by(name: 'Joris Kuehnast')
  },
  {
    asker: User.find_by(name: 'Joris Kuehnast'),
    receiver: User.find_by(name: 'Janis Sidenburg')
  },
   {
    asker: User.find_by(name: 'James Gibson'),
    receiver: User.find_by(name: 'Joris Kuehnast')
  },
  {
    asker: User.find_by(name: 'Joris Kuehnast'),
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
    asker: User.find_by(name: 'Paul Ladwig'),
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
    receiver: User.find_by(name: 'Joris Kuehnast')
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
  },
  {
    asker: User.find_by(name: 'Paul Ladwig'),
    receiver: User.find_by(name: 'Samantha Jonathan')
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
    occasion: 1,
    price: 1,
    review: 'Good restaurant with with low prices as well as competent and fast serviece! Perfect for a quick lunch with a small group of friends.',
    bookmarked: false,
    recommended: true,
    cuisine: 'Italian',
    shared: true,
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'James Gibson'),
    occasion: 2,
    price: 2,
    review: "I really like this place. The food is fresh and delicious. My favourite is the beef pho.",
    recommended: true,
    cuisine: 'Vietnamese',
    shared: true,
    restaurant: Restaurant.find_by(name: 'Restaurant Babami')
  },
  {
    user: User.find_by(name: 'Marie Ladwig'),
    occasion: 4,
    price: 4,
    review: 'The food was excellent with very fresh ingredients. Staff friendly and helpful. We will definitely be visiting again.',
    bookmarked: false,
    recommended: true,
    cuisine: 'Asian Fusion',
    shared: true,
    restaurant: Restaurant.find_by(name: 'Tim Raue')
  },
  {
    user: User.find_by(name: 'Paul Ladwig'),
    bookmarked: true,
    restaurant: Restaurant.find_by(name: 'Tim Raue')
  },
  {
    user: User.find_by(name: 'Otto Jonetzki'),
    occasion: 1,
    price: 2,
    review: "I love Chupenga. They're remarkably fast, the food is consistent of quality, and they have amazing salsas / hotsauces. All for a decent price!",
    bookmarked: false,
    recommended: true,
    cuisine: 'Mexican',
    restaurant: Restaurant.find_by(name: 'Chupenga')
  },
  {
    user: User.find_by(name: 'Frank Maier'),
    bookmarked: true,
    restaurant: Restaurant.find_by(name: 'House of Small Wonder')
  },
  {
    user: User.find_by(name: 'Otto Jonetzki'),
    occasion: 2,
    price: 2,
    review: 'Good restaurant. The service is good, and the food was tasty. Reasonable prices as well.',
    bookmarked: false,
    recommended: true,
    cuisine: 'Vietnamese',
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
    cuisine: 'Italian',
    proposed_date: DateTime.parse("18/12/2019 22:20:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Joris Kuehnast'),
    occasion: 2,
    price: 2,
    review: "A warm, cosy place in Berlin. Place is quite small and usually very crowded but I loved the atmosphere there and the food was so delicious and reasonably priced. I'd recommend to anyone looking for some hearty, warm traditional Vietnamese dishes.",
    bookmarked: false,
    recommended: true,
    cuisine: 'Vietnamese',
    shared: true,
    special: true,
    restaurant: Restaurant.find_by(name: 'Monsieur Vuong')
  },
  {
    user: User.find_by(name: 'Marie Ladwig'),
    occasion: 1,
    price: 1,
    review: "Great food and low prices!! I think it's best suited for lunch. Order pizza Parma or pasta Puttanesca!",
    bookmarked: false,
    recommended: true,
    cuisine: 'Italian',
    shared: true,
    proposed_date: DateTime.parse("2019-02-12 21:00:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Janis Sidenburg'),
    occasion: 2,
    price: 2,
    review: "One of the best Vietnamese restaurants in the area. For a lunch with collegaues its perfect.",
    bookmarked: false,
    recommended: true,
    cuisine: 'Vietnamese',
    restaurant: Restaurant.find_by(name: 'AVAN')
  },
  {
    user: User.find_by(name: 'Joris Kuehnast'),
    occasion: 2,
    price: 2,
    review: "Great place for a quick dinner even with large groups. I like the green curry.",
    bookmarked: false,
    recommended: true,
    shared: true,
    cuisine: 'Vietnamese',
    proposed_date: DateTime.parse("01/12/2019 13:20:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Restaurant Babami')
  },
  {
    user: User.find_by(name: 'Joris Kuehnast'),
    occasion: 1,
    price: 1,
    review: "One of the best price to value ratios I have ever seen! My favourite is the Carbonara.",
    bookmarked: false,
    recommended: true,
    shared: true,
    cuisine: 'Italian',
    proposed_date: DateTime.parse("29/11/2019 13:00:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Otto Jonetzki'),
    occasion: 2,
    price: 2,
    review: "Ok for a qick lunch but I would not go here for dinner, mostly because of the atmosphere!",
    recommended: true,
    cuisine: 'Vietnamese',
    restaurant: Restaurant.find_by(name: 'Viet Bowl Mitte')
  },
  {
    user: User.find_by(name: 'Marie Ladwig'),
    occasion: 2,
    price: 2,
    review: "I ate here twice when I visited Berlin. I like the food, the concept and the ambience. I ordered from the vegan menu, and it was extremely tasty! The vibe was really cool and chilled.",
    recommended: true,
    shared: true,
    cuisine: 'Mexican',
    restaurant: Restaurant.find_by(name: 'Chupenga')
  },
  {
    user: User.find_by(name: 'Joris Kuehnast'),
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
    cuisine: 'Pizza',
    restaurant: Restaurant.find_by(name: 'I Due Forni')
  },
  {
    user: User.find_by(name: 'John Hausmann'),
    occasion: 2,
    price: 2,
    review: "I have been going here since they opened in early last year. Its really good and has never dissapointed me, feew can claim that. No matter what you will get you will be satisfied!",
    recommended: true,
    shared: true,
    cuisine: 'Vietnamese',
    restaurant: Restaurant.find_by(name: 'QUA PHE')
  },
  {
    user: User.find_by(name: 'Samantha Jonathan'),
    occasion: 2,
    price: 2,
    review: "Quiet restaurant with good and not very expensive food. They have mainly polish specialites. The restaurant is nice inside and has very pleasant garden.",
    recommended: true,
    shared: true,
    cuisine: 'Vietnamese',
    restaurant: Restaurant.find_by(name: 'QUA PHE')
  },
  {
    user: User.find_by(name: 'Samantha Jonathan'),
    occasion: 1,
    price: 2,
    review: "We had the most wonderful pizzas here - thoroughly recommend the Piemonte. Never had anything like it. Fantastic service and wonderful reasonably priced wine. So glad we found this place.",
    recommended: true,
    shared: true,
    cuisine: 'Italian',
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Janis Sidenburg'),
    occasion: 1,
    price: 2,
    review: "Visited on a Sunday evening and managed to get a seat upstairs. Beautiful pizza, wine and service. A real gem and reasonably priced. If you like pizza then you must pay a visit!",
    recommended: true,
    shared: false,
    cuisine: 'Italian',
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Frank Maier'),
    occasion: 1,
    price: 1,
    review: "In my opinion, this is by far the best place for lunch close to Checkpoint Charlie. The pizza is delicious, always fresh and with good ingredients. Makes lunch feel like a trip to Italy!",
    recommended: true,
    shared: false,
    cuisine: 'Italian',
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'Janis Sidenburg'),
    bookmarked: true,
    restaurant: Restaurant.find_by(name: "Sale e Tabacchi")
  },
  {
    user: User.find_by(name: 'Frank Maier'),
    occasion: 1,
    price: 2,
    review: "Very good for lunch, especially if you are hungry. Fresh burritos with ingredients (e.g., lentils) you don't get elsewhere. Especially good for vegetarians!",
    recommended: true,
    shared: false,
    cuisine: 'Mexican',
    restaurant: Restaurant.find_by(name: 'Chupenga')
  },
   {
    user: User.find_by(name: 'Frank Maier'),
    occasion: 3,
    price: 3,
    review: "Very good place for Steak. French fries are crisp and their medium-rare steak is always perfect. If you are looking for a very good, non-experimental steak place, go here.",
    recommended: true,
    shared: true,
    cuisine: 'American',
    restaurant: Restaurant.find_by(name: 'Entrecôte')
  },
  {
    user: User.find_by(name: 'Frank Maier'),
    occasion: 2,
    price: 2,
    review: "Very good Asian food! Even my friends from Vietnam go here a lot! My favourite is the green curry.",
    recommended: true,
    shared: false,
    cuisine: 'Vietnamese',
    restaurant: Restaurant.find_by(name: 'QUA PHE')
  },
  {
    user: User.find_by(name: 'Frank Maier'),
    bookmarked: true,
    restaurant: Restaurant.find_by(name: 'I Due Forni')
  },
  {
    user: User.find_by(name: 'Lisa Maibach'),
    bookmarked: true,
    restaurant: Restaurant.find_by(name: 'House of Small Wonder')
  },
   {
    user: User.find_by(name: 'Joris Kuehnast'),
    bookmarked: true,
    restaurant: Restaurant.find_by(name: 'Viet Bowl Mitte')
  },
  {
    user: User.find_by(name: 'Janis Sidenburg'),
    bookmarked: true,
    restaurant: Restaurant.find_by(name: "Let's talk about juice!")
  },
  {
    user: User.find_by(name: 'Viete Leker'),
    occasion: 2,
    price: 1,
    review: "Very tasty and fresh tapas. Soft bottom with so fresh ingredients and vegetables. Very kind lady serving tapas which are cheap, so I really recommend this place.",
    bookmarked: false,
    recommended: true,
    shared: true,
    cuisine: 'Tapas',
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
    cuisine: 'Spanish',
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
    cuisine: 'Tapas',
    proposed_date: DateTime.parse("29/11/2019 13:00:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Barcelona Tapas Bar Restaurant')
  },
  {
    user: User.find_by(name: 'Janis Sidenburg'),
    occasion: 3,
    price: 3,
    review: "This is THE best place for steak in my opinion. I always order rare - super good. My favourite sauce is the pepper-cream sauce.",
    recommended: true,
    shared: true,
    cuisine: 'Steak',
    restaurant: Restaurant.find_by(name: 'Entrecôte')
  },
  {
    user: User.find_by(name: 'Charlotte Bremer'),
    occasion: 2,
    price: 1,
    review: "Great location with lots of possibilities to move on to other bars. Food was good. Wine was good. Tapas were a bit pricy but quality is excellent.",
    bookmarked: false,
    recommended: true,
    cuisine: 'Italian',
    proposed_date: DateTime.parse("29/11/2019 13:00:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Sale e Tabacchi')
  },
  {
    user: User.find_by(name: 'Otto Jonetzki'),
    occasion: 2,
    price: 2,
    review: "The lunch menu is pretty cheap and the food is delicious. They are usually packed during lunch, so better call them and reserve a table beforehand. With the lunch menu you get a complimentary soup which is nice. Card is only accepted if the amount is more than 10 €, so have some cash with you before you dine in.",
    recommended: true,
    cuisine: 'Vietnamese',
    restaurant: Restaurant.find_by(name: 'Mama Cook')
  },
  {
    user: User.find_by(name: 'Marie Ladwig'),
    occasion: 2,
    price: 2,
    review: "Fine prices, delicious food and cocktails. Its located in quiet passage with many different restaurants and bars. Very near to AquaDome.",
    recommended: true,
    cuisine: 'Vietnamese',
    proposed_date: DateTime.parse("20/12/2019 13:30:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Shi-Mai')
  },
  {
    user: User.find_by(name: 'Joris Kuehnast'),
    occasion: 2,
    price: 2,
    review: "Always full for lunch for a reason. Good food and reliable service. Cash only though.",
    recommended: true,
    cuisine: 'Asian-inspired',
    restaurant: Restaurant.find_by(name: 'Otito Vietnamese Food')
  },
  {
    user: User.find_by(name: 'James Gibson'),
    occasion: 2,
    price: 2,
    review: "This is the best quality, real Italian pizza you can get in Barcelona! Its rare to find good pizza like this restaurant in a touristic town but it’s worth the trip if you don’t live in the area. The shaft is adorable absolutely amazing sweet people. I would highly recommend this spot! Don’t forget to book online cos there might not be a spot if you arrive without a booking.",
    recommended: true,
    cuisine: 'Italian',
    restaurant: Restaurant.find_by(name: 'Charlotte 1')
  },
  {
    user: User.find_by(name: 'John Hausmann'),
    occasion: 3,
    price: 3,
    review: "Very affordable, quick and super tasty. Allergen information is very poor and misleading. I'm very allergic to fish, carry an epi-pen, all the dishes (including the vegan options) said they had fish or traces of fish in them. Asked the waitress and she assured they didn't, rather annoying but I didn't die so we all good.",
    recommended: true,
    special: true,
    cuisine: 'Vietnamese',
    restaurant: Restaurant.find_by(name: 'Linh Linh')
  },
  {
    user: User.find_by(name: 'John Hausmann'),
    occasion: 2,
    price: 2,
    review: "I love raw fish and Ceviche in particular. Chicha is one of my favourite places in Berlin for both! I often come here for a dinner with friends during the week.",
    recommended: true,
    cuisine: 'Peruvian',
    restaurant: Restaurant.find_by(name: 'Chicha')
  },
  {
    user: User.find_by(name: 'Janis Sidenburg'),
    occasion: 2,
    price: 3,
    review: "Beautiful restaurant. Calm and cozy environment. Nice and friendly staff. Big tables that takes many plates of food.",
    recommended: true,
    cuisine: 'Vietnamese',
    proposed_date: DateTime.parse("29/01/2020 20:00:00 UTC"),
    restaurant: Restaurant.find_by(name: 'Ngon Restaurant Berlin')
  },
  {
    user: User.find_by(name: 'James Gibson'),
    occasion: 3,
    price: 2,
    review: "Cozy restaurant, very busy for a Monday, so réservations are highly recommended. The food was great too! Fresh ingredients and friendly staff made it all the more enjoyable too. Would definitely recommend going here!",
    recommended: true,
    special: true,
    cuisine: 'Vietnamese',
    restaurant: Restaurant.find_by(name: 'Madami')
  },
  {
    user: User.find_by(name: 'Otto Jonetzki'),
    occasion: 3,
    price: 3,
    review: "Really one of the best cuisine we have found in Berlin so far, and we are here a couple days a month. Refined, friendly atmosphere, great cevices, deserts, meats. Everything we had was delicious.",
    recommended: true,
    cuisine: 'Peruvian',
    restaurant: Restaurant.find_by(name: 'NAUTA Berlín')
  },
  {
    user: User.find_by(name: 'Otto Jonetzki'),
    occasion: 3,
    price: 3,
    review: "One of the nicer places, where to eat in the city center and not to become poor. Prices are moderate and food never disappoints. In love with their duck in peanut sauce. Portions are very big too.",
    recommended: true,
    cuisine: 'Vietnamese',
    restaurant: Restaurant.find_by(name: 'Shi-Mai')
  },
  {
    user: User.find_by(name: 'Janis Sidenburg'),
    occasion: 3,
    price: 3,
    review: "I really liked our dinner at NAUTA. The food is delicious and experimental AND its really fresh and healthy. The trout ceviche was best. One thing to note: you have to like raw fish.",
    recommended: true,
    cuisine: 'Peruvian',
    restaurant: Restaurant.find_by(name: 'NAUTA Berlín')
  },
  {
    user: User.find_by(name: 'Joris Kuehnast'),
    occasion: 2,
    price: 2,
    review: "Delicious is all I can say . Had the crispy duck and sub my noodles for fried rice. Server was also very friendly and personable . Will definitely come here again!",
    recommended: true,
    cuisine: 'Vietnamese',
    restaurant: Restaurant.find_by(name: 'Shi-Mai')
  },
   {
    user: User.find_by(name: 'Marie Ladwig'),
    occasion: 3,
    price: 2,
    review: "Great for a fancy dinner with friends who like to try something different! Not so good for vegetarians or people who don't like raw fish, though!",
    recommended: true,
    cuisine: 'Peruvian',
    restaurant: Restaurant.find_by(name: 'NAUTA Berlín')
  },
  {
    user: User.find_by(name: 'Joris Kuehnast'),
    occasion: 2,
    price: 4,
    review: "I love Entrecôte! Staff is super friendly and the steak is excellent. It's also really cozy there - ask for a table in the back. The best area in my opinion. I love going here with a small group of friends or my girl friend for a nice dinner. They also have an excellent wine list (especially the reds - given it's a steak place).",
    recommended: true,
    cuisine: 'Steak',
    restaurant: Restaurant.find_by(name: 'Entrecôte')
  },
  {
    user: User.find_by(name: 'Marie Ladwig'),
    occasion: 2,
    price: 2,
    review: "If you like raw fish: come here. They also have some vegetable dishes and everything has a very fresh and light taste to it.",
    recommended: true,
    cuisine: 'Peruvian',
    restaurant: Restaurant.find_by(name: 'Cevicheria')
  },
  {
    user: User.find_by(name: 'Samantha Jonathan'),
    occasion: 2,
    price: 2,
    review: "One of my favourite places for Vietnamese places! The staff is super friendly, the food is fresh, and it is really cozy. I have often come here with friends from out of town and they always love it.",
    recommended: true,
    cuisine: 'Vietnamese',
    restaurant: Restaurant.find_by(name: 'Restaurant Babami')
  },
  {
    user: User.find_by(name: 'Samantha Jonathan'),
    occasion: 3,
    price: 3,
    review: "Nauta is really delicious. The fish is super fresh and the Ceviche is to die for. It's Peruvian with a Japanese touch. Good for a nice evening, as it is on the pricier side.",
    recommended: true,
    cuisine: 'Peruvian',
    restaurant: Restaurant.find_by(name: 'NAUTA Berlín')
  },


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
    asker: User.find_by(name: 'Viete Leker'),
    receiver: User.find_by(name: 'Marie Ladwig')
  },
  {
    asker: User.find_by(name: 'Viete Leker'),
    receiver: User.find_by(name: 'Joris Kuehnast')
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
Selection.create(user: User.find_by(name: "Joris Kuehnast"), recommended: true, restaurant: Restaurant.find_by(name: "Entrecôte"), cuisine: 'Steak', review: "I stayed just down the road and came here 4 days out of eight, it’s just so good. Smoked Salmon, pate, scampi all delicious, Steak Au Poivre superb if a little huge, in fact a couldn’t fault a single thing!", occasion: 4, price: 3)

Friendship.create!(add_friendships)

puts "additional friendships created"

puts "additional review"

puts "additional review dones"

puts 'Completed seeding process'

Selection.create(user: User.find_by(name: "Lisa Maibach"), recommended: true, restaurant: Restaurant.find_by(name: "Charlotte 1"), cuisine: 'Italian', review: "I really love this restaurant. I could come here every day and I always bring my colleagues. The pizza is delicious and so is the pasta. My favourite is the pizza parma though.", occasion: 1, price: 1)


Selection.create(user: User.find_by(name: "James Gibson"), recommended: true, restaurant: Restaurant.find_by(name: "I Due Forni"), cuisine: 'Italian', review: "We had the most wonderful pizzas here - thoroughly recommend the Piemonte. Never had anything like it. Fantastic service and wonderful reasonably priced wine. So glad we found this place.", occasion: 2, price: 2)

Selection.create({
    user: User.find_by(name: 'Joris Kuehnast'),
    occasion: 3,
    price: 3,
    review: "If you want an evening out with unusual place this is perfect. The Ceviche is delicious. Make sure you all like raw fish! If you don't you will not like Nauta...",
    recommended: true,
    cuisine: 'Peruvian',
    restaurant: Restaurant.find_by(name: 'NAUTA Berlín')
  })
Friendship.create!({asker: User.find_by(name: 'Johanna Frenche'),receiver: User.find_by(name: 'Paul Ladwig')})

Selection.create({
    user: User.find_by(name: 'Lisa Maibach'),
    occasion: 2,
    price: 2,
    review: "Not only is the food absolutely perfect but also the service is incredible. This small restaurant only has like 10 tables and is run by only two people - the cook and the server. Often they also have a guitarist playing!",
    recommended: true,
    shared: true,
    cuisine: 'Peruvian',
    restaurant: Restaurant.find_by(name: 'Cevicheria')
  })

Selection.create({user: User.find_by(name: 'John Hausmann'),bookmarked: true, cuisine: 'Italian', restaurant: Restaurant.find_by(name: "Sale e Tabacchi")})

Selection.create({
    user: User.find_by(name: 'Janis Sidenburg'),
    occasion: 2,
    price: 2,
    review: "Very good for fish and meat eaters. The Ceviche is super fresh and the lomo saltado is great. Atmosphere is also good, but not super special",
    recommended: true,
    cuisine: 'Peruvian',
    restaurant: Restaurant.find_by(name: 'Chicha')
  })
