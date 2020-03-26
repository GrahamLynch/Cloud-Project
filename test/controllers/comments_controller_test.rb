require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:one)
    @comment = comments(:one)
    @product = products(:one)
    post user_session_url
  end
 test "should create comment" do
   assert_difference('Comment.count') do
       post product_comments_url(@product), params: { comment: { name: @comment.name, body: @comment.body, product: @comment.product} }
   end
   assert_redirected_to product_url(@product)
 end

 test "should destroy comment" do
   assert_difference('Comment.count', -1) do
     delete product_comment_url(@product, @comment)
   end
 end
end
