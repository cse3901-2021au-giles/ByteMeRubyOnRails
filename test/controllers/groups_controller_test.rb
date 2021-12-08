require "test_helper"

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get groups_path
    assert_response :success
  end
end
