require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should be valid" do
    user = User.new(email_address: "test@example.com", password: "password")
    assert user.valid?
  end

  test "email address is required" do
    user = User.new(password: "password")
    user.email_address = nil
    assert_not user.valid?
    assert_includes user.errors[:email_address], "can't be blank"
  end

  test "email address must be unique" do
    User.create(email_address: "test@example.com", password: "password")
    user = User.new(email_address: "test@example.com", password: "password")
    assert_not user.valid?
    assert_includes user.errors[:email_address], "has already been taken"
  end

  test "email address must be valid" do
    user = User.new(email_address: "test", password: "password")
    assert_not user.valid?
    assert_includes user.errors[:email_address], "is invalid"
  end
end
