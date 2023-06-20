require "test_helper"

class Admin::TitlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_titles_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_titles_edit_url
    assert_response :success
  end
end
