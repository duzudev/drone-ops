require "test_helper"

class ComplianceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get compliance_index_url
    assert_response :success
  end
end
