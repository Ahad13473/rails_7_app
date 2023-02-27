require "test_helper"

class EmploymentControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get employment_new_url
    assert_response :success
  end

  test "should get create" do
    get employment_create_url
    assert_response :success
  end
end
