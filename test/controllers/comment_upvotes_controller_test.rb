require 'test_helper'

class CommentUpvotesControllerTest < ActionController::TestCase
  setup do
    @comment_upvote = comment_upvotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_upvotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_upvote" do
    assert_difference('CommentUpvote.count') do
      post :create, comment_upvote: {  }
    end

    assert_redirected_to comment_upvote_path(assigns(:comment_upvote))
  end

  test "should show comment_upvote" do
    get :show, id: @comment_upvote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_upvote
    assert_response :success
  end

  test "should update comment_upvote" do
    patch :update, id: @comment_upvote, comment_upvote: {  }
    assert_redirected_to comment_upvote_path(assigns(:comment_upvote))
  end

  test "should destroy comment_upvote" do
    assert_difference('CommentUpvote.count', -1) do
      delete :destroy, id: @comment_upvote
    end

    assert_redirected_to comment_upvotes_path
  end
end
