#ersetzt fixtures - siehe slides_testing_wt_2_print.html

require 'machinist/active_record'


Sham.title              { Faker::Name.first_name } 
Sham.title              { Faker::Lorem.words(3).join(' ') }
Sham.description        { Faker::Lorem.paragraph }
Sham.image_url          { Faker::Lorem.words(1).to_s + %w(.jpg .png .gif).rand}
Sham.price              { (Faker.numerify(['##.##','#.##'].rand).to_f) }
Sham.expirience_points  {1 + rand(100) }
 
Sham.email          { Faker::Internet.email }
Sham.user_name      { (1..10).map { ('a'..'z').to_a.rand } }
Sham.password       { (1..8).map { ('a'..'z').to_a.rand } }
Sham.first_name     { Faker::Name.first_name }
Sham.last_name      { Faker::Name.last_name }
Sham.street         { Faker::Address.street_address }
Sham.place          { Faker::Address.uk_county }
Sham.zip_code       { Faker.numerify(['#####'].rand) }

# product
Product.blueprint do
  title
  description
  image_url
  price
  expirience_points
end

# admins
Admin.blueprint do
  email
  user_name
  password
end

# users
User.blueprint do
  email
  user_name
  password
  first_name
  last_name
  street
  place
  zip_code
  country 'Germany'
end
