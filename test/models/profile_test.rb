require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  test "should create new profile" do
    profile = Profile.new
    assert_not profile.save
  end

  test "should create valid profile" do
    profile = Profile.new(name: "Graham", gender: "Male", age: "22", location: "Dublin")
    assert_not profile.valid?
  end

  test 'invalid without name' do
    profile = Profile.new(gender: "Male", age: "22", location: "Dublin")
    refute profile.valid?
    assert_not_nil profile.errors[:name]
  end

  test 'invalid without gender' do
    profile = Profile.new(name: "Graham",  age: "22", location: "Dublin")
    refute profile.valid?
    assert_not_nil profile.errors[:gender]
  end

  test 'invalid without age' do
    profile = Profile.new(name: "Graham", gender: "Male",location: "Dublin")
    refute profile.valid?
    assert_not_nil profile.errors[:age]
  end

  test 'invalid without location' do
    profile = Profile.new(name: "Graham", gender: "Male", age: "22")
    refute profile.valid?
    assert_not_nil profile.errors[:location]
  end
end
