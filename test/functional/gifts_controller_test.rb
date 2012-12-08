require 'test_helper'

class GiftsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @gift = gifts(:one)
  end

  test "should get index" do
    get :index, :user_id => @user
    assert_response :success
    assert_not_nil assigns(:gifts)
  end

  test "should get new" do
    get :new, :user_id => @user
    assert_response :success
  end

  test "should create gift" do
    assert_difference('Gift.count') do
      post :create, :user_id => @user, :gift => @gift.attributes
    end

    assert_redirected_to user_gift_path(@user, assigns(:gift))
  end

  test "should show gift" do
    get :show, :user_id => @user, :id => @gift.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :user_id => @user, :id => @gift.to_param
    assert_response :success
  end

  test "should update gift" do
    put :update, :user_id => @user, :id => @gift.to_param, :gift => @gift.attributes
    assert_redirected_to user_gift_path(@user, assigns(:gift))
  end

  test "should destroy gift" do
    assert_difference('Gift.count', -1) do
      delete :destroy, :user_id => @user, :id => @gift.to_param
    end

    assert_redirected_to user_gifts_path(@user)
  end
end
