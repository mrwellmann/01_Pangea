require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "has_many_menues" do
    user = User.make
    menue = Menue.make
    user.menues<<menue
    assert(user.menues.exists?(menue))  
  end
  
  test "has_many_wishlists" do
    user = User.make
    wishlist = Wishlist.make
    user.wishlists<<wishlist
    assert(user.wishlists.exists?(wishlist))  
  end
  
  subject {User.make}
  should_validate_uniqueness_of :user_name
  should_validate_presence_of :user_name
end
