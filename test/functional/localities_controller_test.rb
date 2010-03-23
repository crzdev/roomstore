require 'test_helper'

class LocalitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:localities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create locality" do
    assert_difference('Locality.count') do
      post :create, :locality => { }
    end

    assert_redirected_to locality_path(assigns(:locality))
  end

  test "should show locality" do
    get :show, :id => localities(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => localities(:one).to_param
    assert_response :success
  end

  test "should update locality" do
    put :update, :id => localities(:one).to_param, :locality => { }
    assert_redirected_to locality_path(assigns(:locality))
  end

  test "should destroy locality" do
    assert_difference('Locality.count', -1) do
      delete :destroy, :id => localities(:one).to_param
    end

    assert_redirected_to localities_path
  end
end
