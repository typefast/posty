class PostsController < ApplicationController
  
  before_action :require_admin, only: [:new, :create, :edit]
  
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
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Update Succesful"
      redirect_to @post
    else
      flash[:error] = "There was an error"
      render :edit
    end
  end
  
  private
  
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
