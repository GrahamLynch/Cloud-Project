require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:one)
    @user_one = users(:one)
    @profile = profiles(:one)
    post user_session_url
    @relationship = relationships(:one)
  end
  test "should get index" do
    get user_profiles_url(@user_one)
    assert_response :success
  end

  test "should get new profile" do
    get new_user_profile_url(@user_one)
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post user_profiles_url(@user_one), params: { profile: { name: @profile.name, gender: @profile.gender, age: @profile.age, location: @profile.location } }
    end
    assert_redirected_to user_profile_url(@user_one, Profile.last)
  end

  test "should show profile" do
    get user_profile_url(@user_one, @profile)
    assert_response :success
  end
end
