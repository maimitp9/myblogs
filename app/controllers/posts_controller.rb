class PostsController < ApplicationController
	def index
		@p = Post.all
	end
	def new
		@post = Post.new
		@category = Category.all
	end
	def create
		@post = Post.new(params.require(:post).permit(:title, :body, :category_id))
		if @post.save
			redirect_to posts_path, :notice => 'Post Created'
		else
			render 'new'
		end
	end
	def edit
		@post = Post.find(params[:id])	
	end
	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params.require(:post).permit(:title, :body, :category_id))
			redirect_to post_path, :notice => 'post is successfully updated'
		else
			render 'edit'
		end
	end
	def show
		@post = Post.find(params[:id])
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => 'Your post is deleted'
	end
end
