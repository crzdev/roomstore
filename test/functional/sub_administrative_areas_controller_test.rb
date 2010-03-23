require 'test_helper'

class SubAdministrativeAreasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_administrative_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_administrative_area" do
    assert_difference('SubAdministrativeArea.count') do
      post :create, :sub_administrative_area => { }
    end

    assert_redirected_to sub_administrative_area_path(assigns(:sub_administrative_area))
  end

  test "should show sub_administrative_area" do
    get :show, :id => sub_administrative_areas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sub_administrative_areas(:one).to_param
    assert_response :success
  end

  test "should update sub_administrative_area" do
    put :update, :id => sub_administrative_areas(:one).to_param, :sub_administrative_area => { }
    assert_redirected_to sub_administrative_area_path(assigns(:sub_administrative_area))
  end

  test "should destroy sub_administrative_area" do
    assert_difference('SubAdministrativeArea.count', -1) do
      delete :destroy, :id => sub_administrative_areas(:one).to_param
    end

    assert_redirected_to sub_administrative_areas_path
  end
end
