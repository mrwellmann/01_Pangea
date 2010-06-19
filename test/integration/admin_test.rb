require 'test_helper'

class AdminsTest < ActionController::IntegrationTest

  test "Sign Up admin log out and log in again" do
    signUpAdmin
    logOutAdmin
    logInAdmin
  end
 
  private
  def signUpAdmin
    visit new_admin_registration_path
    fill_in "User name", :with => "Adminn"
    fill_in "Email", :with => "admin@admin.de"
    fill_in "Password", :with => "admin_pw"
    fill_in "Password confirmation", :with => "admin_pw"
    click_button "Sign up"
    #signed_in? :admin
    assert_response :Found

  end
  
  def logInAdmin
    visit new_admin_session_path
    fill_in "User name", :with => "Admin"
    fill_in "Password", :with => "admin_pw"
    click_button "Sign in"
    assert_response :Found
  end
  
  def logOutAdmin
    within '#admin_login_box' do |scope|
      scope.click_link "Sign out"
      assert_response :Found
    end
  end
  
end