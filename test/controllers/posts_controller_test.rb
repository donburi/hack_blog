require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "view_count is incremented" do
  	post = Post.create
  	assert_equal 0, post.view_count

  	get :show, id: post.id
  	get :show, id: post.id

  	post.reload

  	assert_equal 2, post.view_count
  end
end
