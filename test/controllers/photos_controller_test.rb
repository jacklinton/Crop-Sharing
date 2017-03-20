require 'test_helper'

class PhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get _form" do
    get photos__form_url
    assert_response :success
  end

end
