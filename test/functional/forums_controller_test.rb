require 'test_helper'

class ForumsControllerTest < ActionController::TestCase
  setup do
    @forum = forums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forum" do
    assert_difference('Forum.count') do
      post :create, :forum => @forum.attributes
    end

    assert_redirected_to forum_path(assigns(:forum))
  end

  test "should show forum" do
    get :show, :id => @forum.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @forum.to_param
    assert_response :success
  end

  test "should update forum" do
    put :update, :id => @forum.to_param, :forum => @forum.attributes
    assert_redirected_to forum_path(assigns(:forum))
  end

  test "should destroy forum" do
    assert_difference('Forum.count', -1) do
      delete :destroy, :id => @forum.to_param
    end

    assert_redirected_to forums_path
  end
end
