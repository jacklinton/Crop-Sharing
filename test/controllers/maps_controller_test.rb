require 'test_helper'

class MapsControllerTest < ActionDispatch::IntegrationTest
  test "should get _form" do
    get maps__form_url
    assert_response :success
  end

  test "should get _small" do
    get maps__small_url
    assert_response :success
  end

  test "should get _large" do
    get maps__large_url
    assert_response :success
  end

end
