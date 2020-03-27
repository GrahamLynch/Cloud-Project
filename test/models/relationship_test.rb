require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  test "should create new relationship" do
    relationship = Relationship.new
    assert_not relationship.save
  end

  test "valid relationship" do
    relationship = Relationship.new(follower_id: "1", followed_id: "2")
    assert_not relationship.valid?
  end

  test 'invalid without follower_id' do
    relationship = Relationship.new(followed_id: "2")
    refute relationship.valid?
    assert_not_nil relationship.errors[:follower_id]
  end

  test 'invalid without followed_id' do
    relationship = Relationship.new(follower_id: "1")
    refute relationship.valid?
    assert_not_nil relationship.errors[:followed_id]
  end
end
