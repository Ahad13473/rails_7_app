require "test_helper"

class PersonalDataControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get personal_data_new_url
    assert_response :success
  end

  test "should get create" do
    get personal_data_create_url
    assert_response :success
  end
end
