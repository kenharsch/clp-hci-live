require 'test_helper'

class PostUpvotesControllerTest < ActionController::TestCase
  setup do
    @post_upvote = post_upvotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_upvotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_upvote" do
    assert_difference('PostUpvote.count') do
      post :create, post_upvote: {  }
    end

    assert_redirected_to post_upvote_path(assigns(:post_upvote))
  end

  test "should show post_upvote" do
    get :show, id: @post_upvote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_upvote
    assert_response :success
  end

  test "should update post_upvote" do
    patch :update, id: @post_upvote, post_upvote: {  }
    assert_redirected_to post_upvote_path(assigns(:post_upvote))
  end

  test "should destroy post_upvote" do
    assert_difference('PostUpvote.count', -1) do
      delete :destroy, id: @post_upvote
    end

    assert_redirected_to post_upvotes_path
  end
end
