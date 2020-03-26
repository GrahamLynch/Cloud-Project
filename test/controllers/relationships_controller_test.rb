require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    @user_one = users(:one)
    sign_in users(:one)
    @user_one.id = 1
    post user_session_url
    @relationship1 = relationships(:one)

  end

  test "should create relationship" do
  assert_difference('Relationship.count') do
    post relationships_url, params: { relationship: { follower_id: @relationship1.follower_id, followed_id: @relationship1.followed_id, created_at: @relationship1.created_at, updated_at: @relationship1.updated_at} }
        end
        assert_redirected_to relationships_url(Relationship.last)
   end




end
