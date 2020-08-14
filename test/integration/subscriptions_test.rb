require "test_helper"

class SubscriptionsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:marshall)
    log_in_as(@user)
  end

  test "subscriptions page" do
    get subscriptions_user_path(@user)
    assert_not @user.subscriptions.empty?
    assert_match @user.subscriptions.count.to_s, response.body
    @user.subscriptions.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end

  test "subscribers page" do
    get subscribers_user_path(@user)
    assert_not @user.subscribers.empty?
    assert_match @user.subscribers.count.to_s, response.body
    @user.subscribers.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end
end
