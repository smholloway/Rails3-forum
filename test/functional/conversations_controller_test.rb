require 'test_helper'

class ConversationsControllerTest < ActionController::TestCase
  setup do
    @conversation = conversations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conversations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conversation" do
    assert_difference('Conversation.count') do
      post :create, :conversation => @conversation.attributes
    end

    assert_redirected_to conversation_path(assigns(:conversation))
  end

  test "should show conversation" do
    get :show, :id => @conversation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @conversation.to_param
    assert_response :success
  end

  test "should update conversation" do
    put :update, :id => @conversation.to_param, :conversation => @conversation.attributes
    assert_redirected_to conversation_path(assigns(:conversation))
  end

  test "should destroy conversation" do
    assert_difference('Conversation.count', -1) do
      delete :destroy, :id => @conversation.to_param
    end

    assert_redirected_to conversations_path
  end
end
