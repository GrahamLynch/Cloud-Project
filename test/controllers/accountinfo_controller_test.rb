require 'test_helper'

class AccountinfoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get accountinfo_index_url
    assert_response :success
  end
end
