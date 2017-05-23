require 'test_helper'

class ReadingsControllerTest < ActionDispatch::IntegrationTest
  test "should get readings_page" do
    get readings_readings_page_url
    assert_response :success
  end

end
