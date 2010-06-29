require 'test_helper'

class FoodkindTest < ActiveSupport::TestCase
  
  test "has_many_foods" do
    food = Food.make
    foodkind = Foodkind.make
    foodkind.foods<<food
    assert(foodkind.foods.exists?(food))  
  end
  
  should_validate_presence_of :foodkind_name
  
  subject {Foodkind.make}
  should_validate_uniqueness_of :foodkind_name
  
end
