require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get :update" do
    get likes_:update_url
    assert_response :success
  end

  test "should get :destroy" do
    get likes_:destroy_url
    assert_response :success
  end

end
