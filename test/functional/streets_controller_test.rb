require 'test_helper'

class StreetsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:streets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create street" do
    assert_difference('Street.count') do
      post :create, :street => { }
    end

    assert_redirected_to street_path(assigns(:street))
  end

  test "should show street" do
    get :show, :id => streets(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => streets(:one).to_param
    assert_response :success
  end

  test "should update street" do
    put :update, :id => streets(:one).to_param, :street => { }
    assert_redirected_to street_path(assigns(:street))
  end

  test "should destroy street" do
    assert_difference('Street.count', -1) do
      delete :destroy, :id => streets(:one).to_param
    end

    assert_redirected_to streets_path
  end
end
