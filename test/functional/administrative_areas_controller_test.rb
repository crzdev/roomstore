require 'test_helper'

class AdministrativeAreasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administrative_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administrative_area" do
    assert_difference('AdministrativeArea.count') do
      post :create, :administrative_area => { }
    end

    assert_redirected_to administrative_area_path(assigns(:administrative_area))
  end

  test "should show administrative_area" do
    get :show, :id => administrative_areas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => administrative_areas(:one).to_param
    assert_response :success
  end

  test "should update administrative_area" do
    put :update, :id => administrative_areas(:one).to_param, :administrative_area => { }
    assert_redirected_to administrative_area_path(assigns(:administrative_area))
  end

  test "should destroy administrative_area" do
    assert_difference('AdministrativeArea.count', -1) do
      delete :destroy, :id => administrative_areas(:one).to_param
    end

    assert_redirected_to administrative_areas_path
  end
end
