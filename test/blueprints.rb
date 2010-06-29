#ersetzt fixtures - siehe slides_testing_wt_2_print.html

require 'machinist/active_record'

Sham.menue_name         { Faker::Lorem.words(3).join(' ') }

Sham

Sham.wishlist_name      { Faker::Lorem.words(3).join(' ') }
Sham.user_id            {1+ rand(100)}
Sham.visibility_id      {1+ rand(100)}

Sham.visibility_kind    {%w(Public Private).rand}

Sham.foodkind_name      {%w(Drinks Breakfests Lunchs Salads Sides Desserts).rand}

Sham.continent_name     {%w(Amerika 'North America' 'South Amerika' Afrika Asia Europe Australia).rand}

Sham.food_name          { Faker::Lorem.words(3).join(' ') }
Sham.foodkind_id        { 1 + rand(6) }
Sham.continent_id       { 1 + rand(7) }

Sham.product_name       { Faker::Lorem.words(3).join(' ') }
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

#Menues
Menue.blueprint do
  menue_name
  user_id
  visibility_id
  description
  expirience_points
  price
end

#wishlist
Wishlist.blueprint do
  wishlist_name
  user_id
  visibility_id
end

#visibility
Visibility.blueprint do
  visibility_kind
end

#foodkind
Foodkind.blueprint do
  foodkind_name
end

#continent
Continent.blueprint do
  continent_name
end

# food
Food.blueprint do
  food_name
  description
  image_url
  price
  expirience_points
  foodkind_id
  continent_id
end

# product
Product.blueprint do
  product_name
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
