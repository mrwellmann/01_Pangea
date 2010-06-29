require 'test_helper'

class WishlistTest < ActiveSupport::TestCase
  
  test "belongs_to_user" do
    user = User.make
    wishlist = Wishlist.make
    wishlist.user=user
    assert_equal(user.id,wishlist.user_id)
  end
  
  test "belongs_to_visibilitys" do
    visibility = Visibility.make
    wishlist = Wishlist.make
    wishlist.visibility=visibility
    assert_equal(visibility.id,wishlist.visibility_id)
  end
  
  test "has_and_belongs_to_many_products" do
    product = Product.make
    wishlist = Wishlist.make
    wishlist.products<<product
    assert(wishlist.products.exists?(product))
  end
  
  should_validate_presence_of :wishlist_name, :visibility_id , :user_id
  
end
