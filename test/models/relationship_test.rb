require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  setup do
  	@relationship = Relationship.new(follower_id: 1, followed_id: 2)
  end

  test "should valid" do
    assert @relationship.valid?
  end

  test "should require follower" do
  	@relationship.followed_id = nil
    assert_not @relationship.valid?
  end

  test "should require followed" do
  	@relationship.follower_id = nil
    assert_not @relationship.valid?
  end
end
