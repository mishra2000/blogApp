require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get myblogs" do
    get blogs_myblogs_url
    assert_response :success
  end
end
