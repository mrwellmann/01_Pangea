require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  Product.delete_all

  should_validate_presence_of :title, :description, :image_url, :price, :expirience_points
  
  context "validate_uniqueness_of titel" do
    p = Product.make
    should_validate_uniqueness_of :title
  end
  
  #throws error
#  should_validate_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i, 
#                            :message => 'must be a URL for GIF, JPG or PNG image.'

  
  test "should be possible to fill in everything" do
  p = Product.create!(:title => 'WHOPPER®', 
                      :description =>%{<p>Der WHOPPER® ... weiter erzählen).</p>}, 
                      :image_url => '/images/Burger.png',
                      :price => 1.99,
                      :expirience_points =>10)
  assert_equal "WHOPPER® : <p>Der WHOPPER® ... weiter erzählen).</p> : /images/Burger.png : 1.99 : 10", 
               [p.title, p.description, p.image_url, p.price, p.expirience_points].compact.join(" : ")
  end
                                    
  test "product picture should be ether jpg, png, or gif" do
  assert_raise ActiveRecord::RecordInvalid do
    product = Product.create!(:title => 'WHOPPER®', 
                              :description =>%{<p>Der WHOPPER® ... weiter erzählen).</p>}, 
                              :image_url => '/images/Burger.x',
                              :price => 1.99,
                              :expirience_points =>10)
    end
  end
                                  
  test "should not be possible to insert someting else than a number into price or expirience_points" do
  assert_raise ActiveRecord::RecordInvalid do
    product = Product.create!(:title => 'WHOPPER®', 
                              :description =>%{<p>Der WHOPPER® ... weiter erzählen).</p>}, 
                              :image_url => '/images/Burger.png',
                              :price => 'qwer',
                              :expirience_points => 'qwer')
    end
  end
 
  test "should not be possible to insert a number below 0.01 into price and below 0 into expirience_points" do
  assert_raise ActiveRecord::RecordInvalid do
    product = Product.create!(:title => 'WHOPPER®', 
                              :description =>%{<p>Der WHOPPER® ... weiter erzählen).</p>}, 
                              :image_url => '/images/Burger.png',
                              :price => 0,
                              :expirience_points =>-1)
    end
  end
  
  test "expirience points should be an integer" do
  assert_raise ActiveRecord::RecordInvalid do
    product = Product.create!(:title => 'WHOPPER®', 
                              :description =>%{<p>Der WHOPPER® ... weiter erzählen).</p>}, 
                              :image_url => '/images/Burger.png',
                              :price => 1.99,
                              :expirience_points => 1.1)
    end
  end
  
end
