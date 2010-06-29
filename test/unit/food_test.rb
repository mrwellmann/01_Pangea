require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  
  test "belongs_to_continent" do
    continent = Continent.make
    food = Food.make
    food.continent=continent
    assert_equal(continent.id,food.continent_id)
  end
  
  test "belongs_to_foodkind" do
    foodkind = Foodkind.make
    food = Food.make
    food.foodkind = foodkind
    assert_equal(foodkind.id,food.foodkind_id)
  end
  
  test "has_and_belongs_to_many_menues" do
    food = Food.make
    menue = Menue.make
    food.menues<<menue
    assert(food.menues.exists?(menue))
  end
  
  should_validate_presence_of :food_name, :image_url, :price, :expirience_points, :foodkind_id
  
  subject { Food.make }
  should_validate_uniqueness_of :food_name

  
  test "should be possible to fill in everything" do
    f =Food.create( :food_name => 'Wasser',                                 
                    :description => %{Kühles frisches Alpenquellwasser},
                    :image_url => '/images/wasser.png' ,                 
                    :price => 0.99,                                      
                    :expirience_points =>5,                              
                    :foodkind_id => 1,                                   
                    :continent_id =>6)                                   
                      
    assert_equal "Wasser : Kühles frisches Alpenquellwasser : /images/wasser.png : 0.99 : 5 : 1 : 6", 
               [f.food_name, f.description, f.image_url, f.price, f.expirience_points, f.foodkind_id, f.continent_id].compact.join(" : ")
  end
                                    
  test "food picture should be ether jpg, png, or gif" do
  assert_raise ActiveRecord::RecordInvalid do
    Food.create!(:product_name => 'WHOPPER®',
                    :image_url => '/images/wasser.x',
                    :price => 1.99,
                    :foodkind_id => 1, 
                    :expirience_points =>10)
    end
  end
                                  
  test "should not be possible to insert someting else than a number into price or expirience_points" do
  assert_raise ActiveRecord::RecordInvalid do
    Food.create!(:product_name => 'WHOPPER®', 
                    :description =>%{<p>Der WHOPPER® ... weiter erzählen).</p>}, 
                    :image_url => '/images/Burger.png',
                    :price => 'qwer',
                    :foodkind_id => 1,
                    :expirience_points => 'qwer')
    end
  end
 
  test "should not be possible to insert a number below 0.01 into price and below 0 into expirience_points" do
  assert_raise ActiveRecord::RecordInvalid do
    Food.create!(:product_name => 'WHOPPER®', 
                    :description =>%{<p>Der WHOPPER® ... weiter erzählen).</p>}, 
                    :image_url => '/images/Burger.png',
                    :price => 0,
                    :foodkind_id => 1,
                    :expirience_points =>-1)
    end
  end
  
  test "expirience points should be an integer" do
  assert_raise ActiveRecord::RecordInvalid do
    Food.create!(:product_name => 'WHOPPER®', 
                    :description =>%{<p>Der WHOPPER® ... weiter erzählen).</p>}, 
                    :image_url => '/images/Burger.png',
                    :price => 1.99,
                    :foodkind_id => 1,
                    :expirience_points => 1.1)
    end
  end
  
end

