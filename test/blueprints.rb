#ersetzt fixtures - siehe slides_testing_wt_2_print.html

require 'machinist/active_record'


Sham.title              { Faker::Name.first_name } 
Sham.title              { Faker::Lorem.words(3).join(' ') }
Sham.description        { Faker::Lorem.paragraph }
Sham.image_url          { Faker::Lorem.words(1).to_s + %w(.jpg .png .gif).rand}
Sham.price              { (Faker.numerify(['##.##','#.##'].rand).to_f) }
Sham.expirience_points  {1 + rand(100) }
 
Product.blueprint do
  title
  description
  image_url
  price
  expirience_points

end

