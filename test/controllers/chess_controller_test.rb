require 'test_helper'

class ChessControllerTest < ActionController::TestCase
  test "should get tactics" do
    get :tactics
    assert_response :success
  end

  test "should get famous_games" do
    get :famous_games
    assert_response :success
  end

end
