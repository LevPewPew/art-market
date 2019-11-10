# PRODUCTION SEED
# TODO create admin user here
# comment out testing seed for a "real" deployment, leave it in for a demonstration deployment

# TESTING SEED

styles = [
  'None',
  'Miscellaneous',
  'ASCII art',
  'Abstract art',
  'Art Brut',
  'Abstract expressionism',
  'Abstract illusionism',
  'Academic art',
  'Action painting',
  'Aestheticism',
  'Altermodern',
  'American Barbizon school',
  'American impressionism',
  'American realism',
  'American Scene Painting',
  'Analytical art',
  'Antipodeans',
  'Arabesque',
  'Arbeitsrat für Kunst',
  'Art & Language',
  'Art Deco',
  'Art Informel',
  'Art Nouveau',
  'Art photography',
  'Arte Povera',
  'Arts and Crafts movement',
  'Ashcan School',
  'Assemblage',
  'Les Automatistes',
  'Auto-destructive art',
  'Barbizon school',
  'Baroque',
  'Bauhaus',
  'Black Arts Movement',
  'Bengal School of Art',
  'Classical Realism',
  'Cloisonnism',
  'COBRA',
  'Color Field',
  'Context art',
  'Computer art',
  'Concrete art',
  'Conceptual art',
  'Constructivism',
  'Cubism',
  'Cynical realism',
  'Dada',
  'Danube school',
  'Dau-al-Set',
  'De Stijl (also known as Neoplasticism)',
  'Deconstructivism',
  'Digital art',
  'Ecological Art',
  'Environmental art',
  'Modern European ink painting',
  'Excessivism',
  'Expressionism',
  'Fantastic realism',
  'Fauvism',
  'Feminist art',
  'Figurative art',
  'Figuration Libre',
  'Fine Art',
  'Folk art',
  'Fluxus',
  'Funk art',
  'Futurism',
  'Geometric abstract art',
  'Graffiti/Street Art',
  'Gutai group',
  'Gothic art',
  'Happening',
  'Harlem Renaissance',
  'Heidelberg School',
  'Hudson River School',
  'Hurufiyya',
  'Hypermodernism',
  'Hyperrealism',
  'Impressionism',
  'Interactive Art',
  'Institutional critique',
  'International Gothic',
  'International Typographic Style',
  'Kinetic art',
  'Kinetic Pointillism',
  'Kitsch movement',
  'Land art',
  'Les Nabis',
  'Letterism',
  'Light and Space',
  'Lowbrow',
  'Lyco art',
  'Lyrical abstraction',
  'Magic realism',
  'Mannerism',
  'Massurrealism',
  'Maximalism',
  'Metaphysical painting',
  'Mingei',
  'Minimalism',
  'Modernism',
  'Modular constructivism',
  'Naive art',
  'Neoclassicism',
  'Neo-Dada',
  'Neo-expressionism',
  'Neo-figurative',
  'Neoism',
  'Neo-primitivism',
  'Neo-romanticism',
  'Net art',
  'New Objectivity',
  'New Sculpture',
  'Northwest School',
  'Nuclear art',
  'Objective abstraction',
  'Op Art',
  'Orphism',
  'Photorealism',
  'Panfuturism',
  'Pixel art',
  'Plasticien',
  'Plein Air',
  'Pointillism',
  'Pop art',
  'Post-impressionism',
  'Post-minimalism',
  'Precisionism',
  'Pre-Raphaelitism',
  'Primitivism',
  'Private Press',
  'Process art',
  'Psychedelic art',
  'Purism',
  'Qajar art',
  'Quito School',
  'Rasquache',
  'Rayonism',
  'Realism',
  'Regionalism',
  'Remodernism',
  'Renaissance',
  'Rococo',
  'Romanesque',
  'Romanticism',
  'Samikshavad',
  'Serial art',
  'Shin hanga',
  'Shock art',
  'Sōsaku hanga',
  'Socialist realism',
  'Sots art',
  'Space art',
  'Street art',
  'Stuckism',
  'Sumatraism',
  'Superflat',
  'Suprematism',
  'Surrealism',
  'Symbolism',
  'Synchromism',
  'Synthetism',
  'Tachisme (aka Informel)',
  'Toyism',
  'Transgressive art',
  'Tonalism',
  'Ukiyo-e',
  'Underground comix',
  'Unilalianism',
  'Vancouver School',
  'Vanitas',
  'Verdadism',
  'Video art',
  'Visual Art',
  'Viennese Actionism',
  'Vorticism'
]

styles.each do |style|
  Style.create(name: style)
end

TOTAL_USERS = 100

id = 1
TOTAL_USERS.times do |n|
  User.create(
    email: "test#{id}@mail.com",
    password: "asdasd#{id}"
  )
  user = User.last
  user_detail = UserDetail.new(
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    bio: Faker::Lorem.paragraph(sentence_count: rand(2..5)),
    super_user: false,
    comms_mngr: false,
    user_id: user.id
  )
  user_detail.save
  # not using Faker for addresses so that there is real addresses for google maps API
  addresses = [
    {
      line_1: "2 Emu Bank, Belconnen",
      line_2: nil,
      city: "Canberra",
      state: 1,
      postcode: "2617",
      user_detail_id: user_detail.id
    },
    {
      line_1: "201 Pacific Hwy, St Leonards",
      line_2: nil,
      city: "Sydney",
      state: 2,
      postcode: "2065",
      user_detail_id: user_detail.id
    },
    {
      line_1: "3 Tarakan Ct, Johnston",
      line_2: nil,
      city: "Darwin",
      state: 3,
      postcode: "0832",
      user_detail_id: user_detail.id
    },
    {
      line_1: "1006 Wynnum Rd, Cannon Hill",
      line_2: nil,
      city: "Brisbane",
      state: 4,
      postcode: "4170",
      user_detail_id: user_detail.id
    },
    {
      line_1: "575 North East Road, Gilles Plains",
      line_2: nil,
      city: "Adelaide",
      state: 5,
      postcode: "5086",
      user_detail_id: user_detail.id
    },
    {
      line_1: "268 Sandy Bay Rd, Sandy Bay",
      line_2: nil,
      city: nil,
      state: 6,
      postcode: "7005",
      user_detail_id: user_detail.id
    },
    {
      line_1: "120 Racecourse Rd, Flemington",
      line_2: nil,
      city: "Melbourne",
      state: 7,
      postcode: "3031",
      user_detail_id: user_detail.id
    },
    {
      line_1: "285 Walter Rd W, Morley",
      line_2: nil,
      city: "Perth",
      state: 8,
      postcode: "6062",
      user_detail_id: user_detail.id
    }
  ]
  address = Address.new(
    addresses[rand(0..7)]
  )
  address.save

  rand(0..3).times do
    Listing.create(
      title: Faker::Lorem.sentence(word_count: rand(1..4)),
      artist: "#{Faker::Name.first_name} #{Faker::Name.last_name}",price: rand(1..100000),
      description: Faker::Lorem.paragraph(sentence_count: rand(6..18)),
      user_id: user.id
    )
    listing = Listing.last
    listing.picture.attach(io: File.open("app/assets/images/listing_picture_attachments/art#{rand(0..13)}.jpg"), filename: "art_picture_attachment.jpg")
    listing.save
    3.times do
      ListingsStyle.create(
        listing_id: listing.id,
        style_id: rand(1..styles.length)
      )
    end

    rand(0..5).times do
      Comment.create(
        # a pretentious word is inserted here to pass the custom validator
        body: Faker::Lorem.paragraph(sentence_count: rand(1..3)) + " The humanity. " + Faker::Lorem.paragraph(sentence_count: rand(1..3)),
        listing_id: listing.id,
        user_id: rand(1..TOTAL_USERS)
      )
    end
  end

  id = ActiveRecord::Base.connection.execute("select last_value from users_id_seq").first["last_value"] + 1
end

user_id = 0
listing_id = 0
loop do
  user_id = rand(1..TOTAL_USERS)
  listing_id = rand(1..Listing.count)
  if user_id != Listing.find(listing_id).user_id
    break
  end
end
rand((Listing.count / 4)..(Listing.count / 2)).times do
  Purchase.create(
    listing_id: listing_id,
    user_id: user_id
  )
end

# GENERATE ADMIN AND A FEW COMMUNITY MANAGER ACCOUNTS

User.create(
  email: "admin@mail.com",
  password: "supercool"
)
user = User.last
user_detail = UserDetail.new(
  name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
  bio: Faker::Lorem.paragraph(sentence_count: rand(2..5)),
  super_user: true,
  comms_mngr: false,
  user_id: user.id
)
user_detail.save
address = Address.new(
  line_1: Faker::Address.street_address,
  line_2: nil,
  city: Faker::Address.city,
  state: rand(0..7),
  postcode: rand(1000..7999),
  user_detail_id: user_detail.id
)
address.save

User.create(
  email: "mod@mail.com",
  password: "kindacool"
)
user = User.last
user_detail = UserDetail.new(
  name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
  bio: Faker::Lorem.paragraph(sentence_count: rand(2..5)),
  super_user: false,
  comms_mngr: true,
  user_id: user.id
)
user_detail.save
address = Address.new(
  line_1: Faker::Address.street_address,
  line_2: nil,
  city: Faker::Address.city,
  state: rand(0..7),
  postcode: rand(1000..7999),
  user_detail_id: user_detail.id
)
address.save
