require "test_helper"

class ShopControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get shop_home_url
    assert_response :success
  end
end
