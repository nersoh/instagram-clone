require 'test_helper'

class FollowingTest < ActionDispatch::IntegrationTest
  setup do
  	@user = User.create(email: "test@hotmail.com", username: "test", password: "12345678",
  		password_confirmation: "12345678")
  end

  test "followers count" do
    assert true
  end
end
