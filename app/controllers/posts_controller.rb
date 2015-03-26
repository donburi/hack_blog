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
	end

	def create
		@post = Post.new(post_params)

	
		if @post.save
			respond_to do |format|
      			format.html { redirect_to @post, notice: "Post entitled '#{@post.title}' was successfully created." }
      		end
		else
			render 'form'
		end

	end

	def edit
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content, :category, :user_id)
	end

	def update
		@post = Post.find(params[:id])

		@post.update(post_params)

		respond_to do |format|
      			format.html { redirect_to @post, notice: "'#{@post.title}' was successfully updated." }
      		end
	end

	def destroy
		@post = Post.find(params[:id])

		@post.destroy

		respond_to do |format|
      		format.html { redirect_to posts_url, notice: "Post entitled '#{@post.title}' was successfully deleted." }
      	end
	end


end
