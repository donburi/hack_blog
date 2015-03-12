class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])

		@post.increment!(:view_count)
	end

	def new
	end

	def create
		Post.create(title: params[:title], author: params[:author], category: params[:category], content: params[:content])
	
		redirect_to '/posts'
	end

end
