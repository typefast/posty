class PostsController < ApplicationController
  
  def index 
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "New Post Added"
      redirect_to @post
    else
      flash[:error] = "There was an error"
      render :new
    end
  end
  
  private
  
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
