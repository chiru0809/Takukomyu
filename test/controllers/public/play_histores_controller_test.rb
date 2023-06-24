require "test_helper"

class Public::PlayHistoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_play_histores_index_url
    assert_response :success
  end

  test "should get show" do
    get public_play_histores_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_play_histores_edit_url
    assert_response :success
  end
end
