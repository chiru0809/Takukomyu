require "test_helper"

class Admin::PlayHistoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_play_histores_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_play_histores_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_play_histores_edit_url
    assert_response :success
  end
end
