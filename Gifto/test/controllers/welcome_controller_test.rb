require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get welcome_login_url
    assert_response :success
  end

end
