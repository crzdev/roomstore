require 'test_helper'

class MoDistrictsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mo_districts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mo_district" do
    assert_difference('MoDistrict.count') do
      post :create, :mo_district => { }
    end

    assert_redirected_to mo_district_path(assigns(:mo_district))
  end

  test "should show mo_district" do
    get :show, :id => mo_districts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => mo_districts(:one).to_param
    assert_response :success
  end

  test "should update mo_district" do
    put :update, :id => mo_districts(:one).to_param, :mo_district => { }
    assert_redirected_to mo_district_path(assigns(:mo_district))
  end

  test "should destroy mo_district" do
    assert_difference('MoDistrict.count', -1) do
      delete :destroy, :id => mo_districts(:one).to_param
    end

    assert_redirected_to mo_districts_path
  end
end
