require 'test_helper'

class CoordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coord" do
    assert_difference('Coord.count') do
      post :create, :coord => { }
    end

    assert_redirected_to coord_path(assigns(:coord))
  end

  test "should show coord" do
    get :show, :id => coords(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => coords(:one).to_param
    assert_response :success
  end

  test "should update coord" do
    put :update, :id => coords(:one).to_param, :coord => { }
    assert_redirected_to coord_path(assigns(:coord))
  end

  test "should destroy coord" do
    assert_difference('Coord.count', -1) do
      delete :destroy, :id => coords(:one).to_param
    end

    assert_redirected_to coords_path
  end
end
