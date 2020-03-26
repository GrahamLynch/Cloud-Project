require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "should create new prodcut" do
    product = Product.new
    assert_not product.save
  end

  test "should create valid product" do
    product = Product.new(name: "Nike Jacket", description: "Black Nike Jacket", user_id: 1)
    assert_not product.valid?
  end

  test 'invalid without name' do
    product = Product.new(description: "Black Nike Jacket", user_id: 1)
    refute product.valid?
    assert_not_nil product.errors[:name]
  end

  test 'invalid without description' do
    product = Product.new(name: "Nike Jacket", user_id: 1)
    refute product.valid?
    assert_not_nil product.errors[:description]
  end

  test 'invalid without user' do
    product = Product.new(name: "Nike Jacket", description: "Black Nike Jacket")
    refute product.valid?
    assert_not_nil product.errors[:user_id]
  end
end
