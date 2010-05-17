require 'test_helper'

class ProductsTest < ActionController::IntegrationTest
  test "signup Admin" do
    signUpAdmin
  end
  
  setup do
    Product.delete_all
  end

  
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
    loginAdmin
    
    visit products_path
    click_link "New product"
    fill_in "Title", :with => "Sombrero"
    fill_in "Description", :with => "mexican sombrero"
    fill_in "Image url", :with => "sombrero.jpg"
    fill_in "Price", :with => "4.99"
    fill_in "Expirience Points", :with => "25"
    click_button "Create"
  end
  
  def signUpAdmin
    visit new_admin_registration_path
    fill_in "User name", :with => "Markus"
    fill_in "Email", :with => "markus@m.de"
    fill_in "Password", :with => "123456"
    fill_in "Password confirmation", :with => "123456"
    click_button "Sign up"
  end
  
  def loginAdmin
    visit new_admin_session_path
    fill_in "User name", :with => "Markus"
    fill_in "Password", :with => "123456"
    click_button "Sign in"
  end
end