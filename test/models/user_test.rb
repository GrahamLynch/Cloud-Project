require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should create new user" do
    user = User.new
    assert_not user.save
  end

  test "valid user" do
    user = User.new(email: 'grahamlynch10@hotmail.com', encrypted_password: "12345678910")
    assert_not user.valid?
  end


  test 'invalid without email' do
    user = User.new(encrypted_password: "12345678910")
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

  test 'invalid without password' do
    user = User.new(email: 'grahamlynch10@hotmail.com')
    refute user.valid?
    assert_not_nil user.errors[:encrypted_password]
  end

  test 'invalid without clothing preference' do
    user = User.new(email: 'grahamlynch10@hotmail.com',encrypted_password: "12345678910")
    refute user.valid?
    assert_not_nil user.errors[:clothing_preference]
  end


end
