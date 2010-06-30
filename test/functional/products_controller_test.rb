require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
=begin
  setup do
    Product.delete_all
  end
  
 
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end
  
  test "should show product" do
      p = Product.make
      get :show, :id => p.id
      assert_response :success
  end
    
   test "should get new" do
     loginAdmin
     get :new
     assert_response :success
   end
  
    test "should create product" do
      loginAdmin
      assert_difference('Product.count') do
        post :create, :product => Product.plan
      end
      assert_redirected_to product_path(assigns(:product))
    end
    
   test "not should create product" do
     loginAdmin
     assert_no_difference('Product.count') do
        post :create, :product => {}
      end
    end

    test "should get edit" do
      loginAdmin
      p = Product.make
      get :edit, :id => p.id
      assert_response :success
    end
    
     
    test "should update product" do
      loginAdmin
      p = Product.make
      put :update ,:id => p.id, :product => {:title => 'test'}
      assert_redirected_to product_path(assigns(:product))
    end
    
   test "should not update product" do
      loginAdmin
      p = Product.make
      put :update, :id => p.id,:product => {:title => nil}
      #TODO: how to check tha it wen wrong?
      assert_response :ok
    end
  
    test "should destroy product" do
      loginAdmin
      p = Product.make
      assert_difference('Product.count', -1) do
        delete :destroy, :id => p.id.to_param
      end
      assert_redirected_to products_path
    end
  
  private
    def loginAdmin
      @admin_logged_in =  Admin.make
      sign_in :admin,  @admin_logged_in
    end
=end      
end
