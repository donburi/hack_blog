class PostsController < ApplicationController

	def show
		@post = Post.find(params[:id])

		@post.increment!(:view_count)
	end

end
