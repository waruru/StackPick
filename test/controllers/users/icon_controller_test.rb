require "test_helper"

class Users::IconControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_icon_new_url
    assert_response :success
  end
end
