require 'test_helper'

class CancerDiagnosisControllerTest < ActionController::TestCase
  test "should get diagnose" do
    get :diagnose
    assert_response :success
  end

  test "should get results" do
    get :results
    assert_response :success
  end

end
