require 'test_helper'

class PictureTest < ActiveSupport::TestCase
  setup do
  	@picture = Picture.new(caption: "Caption Test for Picture")
  	@picture.image = File.new("test/fixtures/sample-image.png")
  end

  test "should be valid" do
  	assert @picture.valid?
  end
  test "image should be present" do
    @picture.image = nil
    assert_not @picture.valid?
  end

  test "user should be present" do
    @picture.user = nil
    assert_not @picture.valid?
  end

  test "caption should not be too long" do
  	@picture.caption = "x" * 256
  	assert_not @picture.valid?
  end
end
