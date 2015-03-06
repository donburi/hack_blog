require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "lead length is 100 characters" do
  	p = Post.new(content: "x" * 200)
  	assert p.lead.length == 100
  end
end
