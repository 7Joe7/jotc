require 'test_helper'

class ChessControllerTest < ActionController::TestCase

  TITLE = 'Lessons'

  test 'should get tips' do
    get :tips
    assert_response :success
    assert_select 'title', "#{BASE_TITLE} | #{TITLE} | Tips"
  end
end
