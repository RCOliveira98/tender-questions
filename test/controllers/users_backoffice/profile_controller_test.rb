require 'test_helper'

class UsersBackoffice::ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get users_backoffice_profile_edit_url
    assert_response :success
  end

end
