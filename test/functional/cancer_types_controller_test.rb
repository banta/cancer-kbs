require 'test_helper'

class CancerTypesControllerTest < ActionController::TestCase
  setup do
    @cancer_type = cancer_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cancer_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cancer_type" do
    assert_difference('CancerType.count') do
      post :create, cancer_type: @cancer_type.attributes
    end

    assert_redirected_to cancer_type_path(assigns(:cancer_type))
  end

  test "should show cancer_type" do
    get :show, id: @cancer_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cancer_type.to_param
    assert_response :success
  end

  test "should update cancer_type" do
    put :update, id: @cancer_type.to_param, cancer_type: @cancer_type.attributes
    assert_redirected_to cancer_type_path(assigns(:cancer_type))
  end

  test "should destroy cancer_type" do
    assert_difference('CancerType.count', -1) do
      delete :destroy, id: @cancer_type.to_param
    end

    assert_redirected_to cancer_types_path
  end
end
