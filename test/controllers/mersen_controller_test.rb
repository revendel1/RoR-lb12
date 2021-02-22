require 'test_helper'

class MersenControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get mersen_input_url
    assert_response :success
  end
end
