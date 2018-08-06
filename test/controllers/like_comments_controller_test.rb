require 'test_helper'

class LikeCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get like_comments_new_url
    assert_response :success
  end

  test "should get index" do
    get like_comments_index_url
    assert_response :success
  end

  test "should get show" do
    get like_comments_show_url
    assert_response :success
  end

  test "should get edit" do
    get like_comments_edit_url
    assert_response :success
  end

end
