require 'test_helper'

class AdminsTest < ActionController::IntegrationTest
  test "sing up" do
    visit new_admin_registration_path
    fill_in "User name", :with => "Admin"
    fill_in "Email", :with => "admin@admin.de"
    fill_in "Password", :with => "123456"
    fill_in "Password confirmation", :with => "123456"
    click_button "Sign up"
    
     within '#admin_login_box' do |scope|
      scope.click_link "Sign out"
      assert_response :succsess
    end
  end
  
   test "Sign Up admin log out and log in again" do
    signUpAdmin
    logOutAdmin
    logInAdmin
  end
 
  private
    def signUpAdmin
    visit new_admin_registration_path
    fill_in "User name", :with => "Admin"
    fill_in "Email", :with => "admin@admin.de"
    fill_in "Password", :with => "123456"
    fill_in "Password confirmation", :with => "123456"
    click_button "Sign up"
    assert_response :succsess
    #assert_redirected_to root_path
  end
  
  def logInAdmin
    visit new_admin_session_path
    fill_in "User name", :with => "Admin"
    fill_in "Password", :with => "123456"
    click_button "Sign in"
    assert_response :success
    #assert_redirected_to root_path
  end
  
  def logOutAdmin
    within '#admin_login_box' do |scope|
      scope.click_link "Sign out"
    end
  end
  
end