require 'test_helper'

class DownloadsControllerTest < ActionController::TestCase
  test "should get stash_workflow" do
    get :stash_workflow
    assert_response :success
  end

end
