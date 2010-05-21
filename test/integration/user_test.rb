require 'test_helper'

class UsersTest < ActionController::IntegrationTest
  
  test "Sign Up user log out and log in again" do
    signUpUser
    logOutUser
    logInUser
  end 
  
  def signUpUser
    visit new_user_registration_path
    fill_in "User name", :with => "User"
    fill_in "Email", :with => "user@user.de"
    fill_in "Password", :with => "123456"
    fill_in "Password confirmation", :with => "123456"
    click_button "Sign up"
    assert_redirected_to root_path
  end
  
  def logInUser
    visit new_admin_session_path
    fill_in "User name", :with => "Admin"
    fill_in "Password", :with => "123456"
    click_button "Sign in"
    assert_redirected_to root_path
  end
  
  def logOutUser
    visit root_path
    click_link_within '#user_login_box','Sign out'
  end
  
end