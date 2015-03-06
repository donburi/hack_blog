require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "lead is the same if lead is less than 100 chatacters" do
  	p = Post.new(content: "Hello")
  	assert_equal p.lead, "Hello..."
  end

  test "lead length is 100 characters and includes ..." do
  	p = Post.new(content: "x" * 200)
  	assert_equal ("x" * 100) + "...", p.lead
  end
end
