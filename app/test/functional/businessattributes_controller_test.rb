require 'test_helper'

class BusinessattributesControllerTest < ActionController::TestCase
  setup do
    @businessattribute = businessattributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:businessattributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create businessattribute" do
    assert_difference('Businessattribute.count') do
      post :create, businessattribute: { attribute_id: @businessattribute.attribute_id, business_id: @businessattribute.business_id }
    end

    assert_redirected_to businessattribute_path(assigns(:businessattribute))
  end

  test "should show businessattribute" do
    get :show, id: @businessattribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @businessattribute
    assert_response :success
  end

  test "should update businessattribute" do
    put :update, id: @businessattribute, businessattribute: { attribute_id: @businessattribute.attribute_id, business_id: @businessattribute.business_id }
    assert_redirected_to businessattribute_path(assigns(:businessattribute))
  end

  test "should destroy businessattribute" do
    assert_difference('Businessattribute.count', -1) do
      delete :destroy, id: @businessattribute
    end

    assert_redirected_to businessattributes_path
  end
end
