require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
  	@john = User.create(email: "user1@hotmail.com", username: "test", password: "12345678",
  		password_confirmation: "12345678")

  	@alex = User.create(email: "user2@hotmail.com", username: "test2", password: "12345678",
  		password_confirmation: "12345678")
  end

  test "should be able to follow and unfollow a user" do
  	assert_not @john.following?(@alex) 
  	@john.follow(@alex)
  	assert @john.following?(@alex)
  	assert @alex.followers.include?(@john)
  	@john.unfollow(@alex)
  	assert_not @john.following?(@alex)
  	assert_not @alex.followers.include?(@john)
  end

  test "should not follow himself" do
  	@john.follow(@john)
  	assert_not @john.following?(@john)
  end
end
