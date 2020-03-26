require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should create new comment" do
    comment = Comment.new
    assert_not comment.save
  end

  test "valid comment" do
    comment = Comment.new(name: 'Graham Lynch', body: "I love this product")
    assert_not comment.valid?
  end

  test 'invalid without name' do
    comment = Comment.new(body: "I love this product")
    refute comment.valid?
    assert_not_nil comment.errors[:name]
  end

  test 'invalid without body' do
    comment = Comment.new(name: "Graham Lynch",)
    refute comment.valid?
    assert_not_nil comment.errors[:body]
  end

end
