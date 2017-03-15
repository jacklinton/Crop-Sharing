require 'test_helper'

class InvitesControllerTest < ActionDispatch::IntegrationTest
  test "should get _form" do
    get invites__form_url
    assert_response :success
  end

  test "should get new" do
    get invites_new_url
    assert_response :success
  end

  test "should get edit" do
    get invites_edit_url
    assert_response :success
  end

end
