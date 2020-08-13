require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should follow and unfollow a user" do
    marshall = users(:marshall)
    nyasha = users(:nyasha)
    assert_not marshall.subscriptions?(nyasha)
    marshall.follow(nyasha)
    assert marshall.subscriptions?(nyasha)
    assert nyasha.subscribers.include?(marshall)
    marshall.unfollow(nyasha)
    assert_not marshall.subscriptions?(nyasha)
  end
end
