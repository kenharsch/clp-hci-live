require 'test_helper'

class AdminPgControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
