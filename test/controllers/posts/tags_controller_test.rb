require "test_helper"

class Posts::TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @posts_tag = posts_tags(:one)
  end

  test "should get index" do
    get posts_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_posts_tag_url
    assert_response :success
  end

  test "should create posts_tag" do
    assert_difference("Posts::Tag.count") do
      post posts_tags_url, params: { posts_tag: {  } }
    end

    assert_redirected_to posts_tag_url(Posts::Tag.last)
  end

  test "should show posts_tag" do
    get posts_tag_url(@posts_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_posts_tag_url(@posts_tag)
    assert_response :success
  end

  test "should update posts_tag" do
    patch posts_tag_url(@posts_tag), params: { posts_tag: {  } }
    assert_redirected_to posts_tag_url(@posts_tag)
  end

  test "should destroy posts_tag" do
    assert_difference("Posts::Tag.count", -1) do
      delete posts_tag_url(@posts_tag)
    end

    assert_redirected_to posts_tags_url
  end
end
