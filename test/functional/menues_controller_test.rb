require 'test_helper'

class MenuesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menue" do
    assert_difference('Menue.count') do
      post :create, :menue => { }
    end

    assert_redirected_to menue_path(assigns(:menue))
  end

  test "should show menue" do
    get :show, :id => menues(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => menues(:one).to_param
    assert_response :success
  end

  test "should update menue" do
    put :update, :id => menues(:one).to_param, :menue => { }
    assert_redirected_to menue_path(assigns(:menue))
  end

  test "should destroy menue" do
    assert_difference('Menue.count', -1) do
      delete :destroy, :id => menues(:one).to_param
    end

    assert_redirected_to menues_path
  end
end
