require 'rails_helper'

def sign_up
  visit "/"
  click_link "Sign In/Up"
  click_link "Sign up"
  fill_in "Email", with: "capy1@mail.com"
  fill_in "Password", with: "asdasd1"
  fill_in "Password confirmation", with: "asdasd1"
  click_button "Sign up"
end

def create_styles
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
end

def fill_user_details
  visit "/"
  click_link "Account Details"
  fill_in "Name", with: "Art Vandelay"
  fill_in "Bio", with: "I have no job and i live with my mother."
  fill_in "Line 1", with: "575 North East Road, Gilles Plains"
  fill_in "Line 2", with: ""
  fill_in "City", with: "Adelaide"
  select :SA, from: "State"
  fill_in "Postcode", with: "5086"
  click_button "Update User detail"
end

def create_listing
  visit "/"
  click_link "Submit a Piece of Art"
  fill_in "Title", with: "Cube Man and Cube Boy"
  fill_in "Artist", with: "Picasso"
  fill_in "Price", with: 123
  fill_in "Description", with: "Some guy with a nose where his cheeck should be, post-modern zeitgeist"
  select "ASCII art", from: "listing_listings_styles_attributes_0_style_id"
  select "Art Brut", from: "listing_listings_styles_attributes_1_style_id"
  select "Art Deco", from: "listing_listings_styles_attributes_2_style_id"
  click_button "Create Listing"
end

RSpec.feature "Create a Listing" do
  it "User creates a Listing succesfully" do
    sign_up
    fill_user_details
    create_styles

    visit "/"
    click_link "Submit a Piece of Art"
    fill_in "Title", with: "Cube Man and Cube Boy"
    fill_in "Artist", with: "Picasso"
    fill_in "Price", with: 123
    fill_in "Description", with: "Some guy with a nose where his cheeck should be, post-modern zeitgeist"
    select "ASCII art", from: "listing_listings_styles_attributes_0_style_id"
    select "Art Brut", from: "listing_listings_styles_attributes_1_style_id"
    select "Art Deco", from: "listing_listings_styles_attributes_2_style_id"
    click_button "Create Listing"
    expect(page).to have_content("Listing was successfully created.")
  end

  it "User cannot make untitled listing" do
    sign_up
    fill_user_details
    create_styles

    visit "/"
    click_link "Submit a Piece of Art"
    fill_in "Title", with: ""
    fill_in "Artist", with: "Picasso"
    fill_in "Price", with: 123
    fill_in "Description", with: "Some guy with a nose where his cheeck should be, post-modern zeitgeist"
    select "ASCII art", from: "listing_listings_styles_attributes_0_style_id"
    select "Art Brut", from: "listing_listings_styles_attributes_1_style_id"
    select "Art Deco", from: "listing_listings_styles_attributes_2_style_id"
    click_button "Create Listing"
    expect(page).to have_content("New Art Submission")
  end
end