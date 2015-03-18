class PostsController < ApplicationController

	def index
		if params[:q].present?
			@post = Post.search(params[:q])
		else
			@post = Post.all
		end
	end

	def show
		@post = Post.find(params[:id])

		@post.increment!(:view_count)
	end

	def new
		@post = Post.new

		render 'form'
	end

	def create
		@post = Post.new(post_params)
	
		if @post.save
			redirect_to '/posts'
		else
			render 'form'
		end

	end

	def edit
		@post = Post.find(params[:id])

		render 'form'
	end

	def post_params
		params.require(:post).permit(:title, :content, :category, :author)
	end

	def update
		@post = Post.find(params[:id])

		@post.update(post_params)

		redirect_to "/posts/#{params[:id]}"
	end


end
