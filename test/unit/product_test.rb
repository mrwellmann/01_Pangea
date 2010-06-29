require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  test "belongs_to_continent" do
    product = Product.make
    continent = Continent.make
    product.continent=continent
    assert_equal(continent.id,product.continent_id)
  end
  
  test "has_and_belongs_to_many_menues" do
    product = Product.make
    wishlist = Wishlist.make
    product.wishlists<<wishlist
    assert(product.wishlists.exists?(wishlist))
  end
  
  should_validate_presence_of :product_name, :image_url, :price, :expirience_points
    
  subject {Product.make}
  should_validate_uniqueness_of :product_name
  
  test "should be possible to fill in everything" do
    p =Product.create(:product_name => 'WM Ball 2006' ,
                      :description => %{Offizieller Spielball der FIFA Fußball-WM 2010 in Südafrika},
                      :image_url => '/images/wmball.jpg' ,
                      :price => 69.99,
                      :expirience_points =>100,
                      :continent_id => 4)                    
    assert_equal "WM Ball 2006 : Offizieller Spielball der FIFA Fußball-WM 2010 in Südafrika : /images/wmball.jpg : 69.99 : 100 : 4", 
               [p.product_name, p.description, p.image_url, p.price, p.expirience_points,p.continent_id].compact.join(" : ")
  end
                                    
 test "product picture should be ether jpg, png, or gif" do
  assert_raise ActiveRecord::RecordInvalid do
    Product.create!(:product_name => 'WHOPPER®',
                    :image_url => '/images/Burger.x',
                    :price => 1.99,
                    :expirience_points =>10)
    end
  end
                                  
  test "should not be possible to insert someting else than a number into price or expirience_points" do
  assert_raise ActiveRecord::RecordInvalid do
    Product.create!(:product_name => 'WHOPPER®', 
                    :description =>%{<p>Der WHOPPER® ... weiter erzählen).</p>}, 
                    :image_url => '/images/Burger.png',
                    :price => 'qwer',
                    :expirience_points => 'qwer')
    end
  end
 
  test "should not be possible to insert a number below 0.01 into price and below 0 into expirience_points" do
  assert_raise ActiveRecord::RecordInvalid do
    Product.create!(:product_name => 'WHOPPER®', 
                    :description =>%{<p>Der WHOPPER® ... weiter erzählen).</p>}, 
                    :image_url => '/images/Burger.png',
                    :price => 0,
                    :expirience_points =>-1)
    end
  end
  
  test "expirience points should be an integer" do
  assert_raise ActiveRecord::RecordInvalid do
    Product.create!(:product_name => 'WHOPPER®', 
                    :description =>%{<p>Der WHOPPER® ... weiter erzählen).</p>}, 
                    :image_url => '/images/Burger.png',
                    :price => 1.99,
                    :expirience_points => 1.1)
    end
  end
  
end
