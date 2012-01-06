require 'test_helper'

class CancerSymptomsControllerTest < ActionController::TestCase
  setup do
    @cancer_symptom = cancer_symptoms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cancer_symptoms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cancer_symptom" do
    assert_difference('CancerSymptom.count') do
      post :create, cancer_symptom: @cancer_symptom.attributes
    end

    assert_redirected_to cancer_symptom_path(assigns(:cancer_symptom))
  end

  test "should show cancer_symptom" do
    get :show, id: @cancer_symptom.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cancer_symptom.to_param
    assert_response :success
  end

  test "should update cancer_symptom" do
    put :update, id: @cancer_symptom.to_param, cancer_symptom: @cancer_symptom.attributes
    assert_redirected_to cancer_symptom_path(assigns(:cancer_symptom))
  end

  test "should destroy cancer_symptom" do
    assert_difference('CancerSymptom.count', -1) do
      delete :destroy, id: @cancer_symptom.to_param
    end

    assert_redirected_to cancer_symptoms_path
  end
end
