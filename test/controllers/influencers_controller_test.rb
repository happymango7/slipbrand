require 'test_helper'

class InfluencersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get influencers_index_url
    assert_response :success
  end

  test "should get show" do
    get influencers_show_url
    assert_response :success
  end

end
