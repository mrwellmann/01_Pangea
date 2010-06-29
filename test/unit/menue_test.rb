require 'test_helper'

class MenueTest < ActiveSupport::TestCase
  test "belongs_to_user" do
    user = User.make
    menue = Menue.make
    menue.user=user
    assert_equal(user.id,menue.user_id)
  end
  
  test "belongs_to_visibilitys" do
    visibility = Visibility.make
    menue = Menue.make
    menue.visibility=visibility
    assert_equal(visibility.id,menue.visibility_id)
  end
  
  test "has_and_belongs_to_many_menues" do
    food = Food.make
    menue = Menue.make
    menue.foods<<food
    assert(menue.foods.exists?(food))
  end
  
  should_validate_presence_of :menue_name, :expirience_points, :price  
  
  test "should be possible to fill in everything" do
    m =Menue.create(:menue_name => 'Public Meal 1 User 1',              
                     :user_id => 1,                       
                     :visibility_id =>1,                
                     :description => 'Alcoholic',         
                     :expirience_points => 50,            
                     :price => 9.93)                      
                      
    assert_equal "Public Meal 1 User 1 : 1 : 1 : Alcoholic : 50 : 9.93", 
               [m.menue_name, m.user_id, m.visibility_id, m.description, m.expirience_points,m.price].compact.join(" : ")
  end
                                  
  test "should not be possible to insert someting else than a number into price or expirience_points" do
  assert_raise ActiveRecord::RecordInvalid do
    Product.create!(:menue_name => 'Meal',
                    :price => 'qwer',
                    :expirience_points => 'qwer')
    end
  end
 
  test "should not be possible to insert a number below 0.01 into price and below 0 into expirience_points" do
  assert_raise ActiveRecord::RecordInvalid do
    Product.create!(:menue_name => 'Meal', 
                    :price => 0,
                    :expirience_points =>-1)
    end
  end
  
  test "expirience points should be an integer" do
  assert_raise ActiveRecord::RecordInvalid do
    Product.create!(:menue_name => 'Meal', 
                    :price => 1.99,
                    :expirience_points => 1.1)
    end
  end
end
