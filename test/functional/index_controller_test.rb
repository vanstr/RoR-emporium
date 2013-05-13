require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get place_order" do
    get :place_order
    assert_response :success
  end

  test "should get hank_you/checkout" do
    get :hank_you/checkout
    assert_response :success
  end

end
