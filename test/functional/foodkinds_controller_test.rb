require 'test_helper'

class FoodkindsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foodkinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create foodkind" do
    assert_difference('Foodkind.count') do
      post :create, :foodkind => { }
    end

    assert_redirected_to foodkind_path(assigns(:foodkind))
  end

  test "should show foodkind" do
    get :show, :id => foodkinds(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => foodkinds(:one).to_param
    assert_response :success
  end

  test "should update foodkind" do
    put :update, :id => foodkinds(:one).to_param, :foodkind => { }
    assert_redirected_to foodkind_path(assigns(:foodkind))
  end

  test "should destroy foodkind" do
    assert_difference('Foodkind.count', -1) do
      delete :destroy, :id => foodkinds(:one).to_param
    end

    assert_redirected_to foodkinds_path
  end
end
