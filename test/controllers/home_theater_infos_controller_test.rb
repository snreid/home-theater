require 'test_helper'

class HomeTheaterInfosControllerTest < ActionController::TestCase
  setup do
    @home_theater_info = home_theater_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:home_theater_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create home_theater_info" do
    assert_difference('HomeTheaterInfo.count') do
      post :create, home_theater_info: {  }
    end

    assert_redirected_to home_theater_info_path(assigns(:home_theater_info))
  end

  test "should show home_theater_info" do
    get :show, id: @home_theater_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @home_theater_info
    assert_response :success
  end

  test "should update home_theater_info" do
    patch :update, id: @home_theater_info, home_theater_info: {  }
    assert_redirected_to home_theater_info_path(assigns(:home_theater_info))
  end

  test "should destroy home_theater_info" do
    assert_difference('HomeTheaterInfo.count', -1) do
      delete :destroy, id: @home_theater_info
    end

    assert_redirected_to home_theater_infos_path
  end
end
