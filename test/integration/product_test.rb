require 'test_helper'

class ProductsTest < ActionController::IntegrationTest
  include Devise::TestHelpers
  Product.delete_all

  
  test "create a new product and open show view" do
    assert_difference("Product.count") do
      addProductSombrero
    end
  end
  
  test "edit a existing product" do
    Product.delete_all # here because rcov throws test Failure ( but only rcov normal testing run without)
    addProductSombrero
    click_link "Edit"
    fill_in "Description", :with => "A mexican sombrero"
    click_button "Update"
    
    assert_equal("A mexican sombrero", Product.first.description)
  end
  
  test "show a existing product" do
    addProductSombrero
    visit products_path
    click_link "Show"
  end
  
  test "delete a existing Product" do
    addProductSombrero
    click_link "Back"
    assert_difference("Product.count", -1) do
      click_link "Delete"
      #confrim "are you sure" ?
    end
  end
  
  private
  def addProductSombrero
    
    #TODO: login admin
    @admin_logged_in =  Admin.make
    sign_in :admin,  @admin_logged_in
    
    visit products_path
    click_link "New product"
    fill_in "Titel", :with => "Sombrero"
    fill_in "Description", :with => "mexican sombrero"
    fill_in "Image url", :with => "sombrero.jpg"
    fill_in "Price", :with => "4.99"
    fill_in "Expirience Points", :with => "25"
    click_button "Create"
  end
end