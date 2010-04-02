require 'test_helper'

class AddressSubwayStationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:address_subway_stations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address_subway_station" do
    assert_difference('AddressSubwayStation.count') do
      post :create, :address_subway_station => { }
    end

    assert_redirected_to address_subway_station_path(assigns(:address_subway_station))
  end

  test "should show address_subway_station" do
    get :show, :id => address_subway_stations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => address_subway_stations(:one).to_param
    assert_response :success
  end

  test "should update address_subway_station" do
    put :update, :id => address_subway_stations(:one).to_param, :address_subway_station => { }
    assert_redirected_to address_subway_station_path(assigns(:address_subway_station))
  end

  test "should destroy address_subway_station" do
    assert_difference('AddressSubwayStation.count', -1) do
      delete :destroy, :id => address_subway_stations(:one).to_param
    end

    assert_redirected_to address_subway_stations_path
  end
end
