require 'test_helper'

class WxControllerTest < ActionController::TestCase
#  fixtures :current_conditions

  def test_index
    get :index
    assert_response :success
  end
end
