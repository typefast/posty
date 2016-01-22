class CommentsController < ApplicationController
  
  def create 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    
    if @comment.save
      flash[:success] = "New comment added."
      redirect_to @post
    else  
      flash[:error] = "There was an error!"
      redirect_to @post
    end
  end
  
  private
    
    def comment_params
      params.require(:comment).permit(:title, :body)
    end
end
