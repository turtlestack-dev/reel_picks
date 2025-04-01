require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user with valid parameters" do
    assert_difference("User.count") do
      post users_url, params: {
        user: {
          email_address: "test@example.com",
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end

    assert_redirected_to root_url
    assert_equal "Welcome to Reel Picks!", flash[:notice]
  end

  test "should not create user with invalid email" do
    assert_no_difference("User.count") do
      post users_url, params: {
        user: {
          email_address: "invalid-email",
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should not create user with mismatched passwords" do
    assert_no_difference("User.count") do
      post users_url, params: {
        user: {
          email_address: "test@example.com",
          password: "password123",
          password_confirmation: "different123"
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should not create user with missing email" do
    assert_no_difference("User.count") do
      post users_url, params: {
        user: {
          email_address: "",
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should not create user with missing password" do
    assert_no_difference("User.count") do
      post users_url, params: {
        user: {
          email_address: "test@example.com",
          password: "",
          password_confirmation: ""
        }
      }
    end

    assert_response :unprocessable_entity
  end
end
