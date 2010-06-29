require 'test_helper'

class VisibilityTest < ActiveSupport::TestCase
  
  test "has_many_menues" do
    visibility = Visibility.make
    menue = Menue.make
    visibility.menues<<menue
    assert(visibility.menues.exists?(menue))  
  end
  
  test "has_many_wishlists" do
    visibility = Visibility.make
    wishlist = Wishlist.make
    visibility.wishlists<<wishlist
    assert(visibility.wishlists.exists?(wishlist))  
  end
  
  should_validate_presence_of :visibility_kind
  
  subject {Visibility.make}
  should_validate_uniqueness_of :visibility_kind

  
end
