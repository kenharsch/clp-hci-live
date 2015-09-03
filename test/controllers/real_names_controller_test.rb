require 'test_helper'

class RealNamesControllerTest < ActionController::TestCase
  setup do
    @real_name = real_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:real_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create real_name" do
    assert_difference('RealName.count') do
      post :create, real_name: {  }
    end

    assert_redirected_to real_name_path(assigns(:real_name))
  end

  test "should show real_name" do
    get :show, id: @real_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @real_name
    assert_response :success
  end

  test "should update real_name" do
    patch :update, id: @real_name, real_name: {  }
    assert_redirected_to real_name_path(assigns(:real_name))
  end

  test "should destroy real_name" do
    assert_difference('RealName.count', -1) do
      delete :destroy, id: @real_name
    end

    assert_redirected_to real_names_path
  end
end
