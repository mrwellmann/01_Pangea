require 'test_helper'

class ContinentTest < ActiveSupport::TestCase
  
  test "has_many_foods" do
    food = Food.make
    continent = Continent.make
    continent.foods<<food
    assert(continent.foods.exists?(food))  
  end
  
  test "has_many_products" do
    product = Product.make
    continent = Continent.make
    continent.products<<product
    assert(continent.products.exists?(product))  
  end
  
  should_validate_presence_of :continent_name
  
  subject { Continent.make }
  should_validate_uniqueness_of :continent_name

   
end
