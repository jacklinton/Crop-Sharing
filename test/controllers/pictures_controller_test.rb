require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get _form" do
    get pictures__form_url
    assert_response :success
  end

  test "should get new" do
    get pictures_new_url
    assert_response :success
  end

  test "should get edit" do
    get pictures_edit_url
    assert_response :success
  end

end
