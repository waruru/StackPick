require "test_helper"

class Posts::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posts_tags_index_url
    assert_response :success
  end
end
