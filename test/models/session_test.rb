require "test_helper"

class SessionTest < ActiveSupport::TestCase
  test "has a user" do
    assert_respond_to Session.new, :user
  end
end
