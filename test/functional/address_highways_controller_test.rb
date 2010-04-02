require 'test_helper'

class AddressHighwaysControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:address_highways)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address_highway" do
    assert_difference('AddressHighway.count') do
      post :create, :address_highway => { }
    end

    assert_redirected_to address_highway_path(assigns(:address_highway))
  end

  test "should show address_highway" do
    get :show, :id => address_highways(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => address_highways(:one).to_param
    assert_response :success
  end

  test "should update address_highway" do
    put :update, :id => address_highways(:one).to_param, :address_highway => { }
    assert_redirected_to address_highway_path(assigns(:address_highway))
  end

  test "should destroy address_highway" do
    assert_difference('AddressHighway.count', -1) do
      delete :destroy, :id => address_highways(:one).to_param
    end

    assert_redirected_to address_highways_path
  end
end
