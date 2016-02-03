class CommentsController < ApplicationController
  before_action :require_comment_user
  before_action :article_item
  before_action :admin_user, only: :destroy
  
  def create
    @comment = @article.comments.build(comments_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Thanks for your comment!"
      redirect_to article_path(@article)
    else
      flash[:danger] = "Oops, something went wrong saving your comment."
      redirect_to :back
    end
    
  end
  
  def destroy
    @comment = Comment.find(params[:id]).destroy
    flash[:success] = "Your comment was deleted successfully."
    redirect_to :back
  end
  
  private
     
      def comments_params
        params.require(:comment).permit(:body)
      end
      
      def article_item
        @article = Article.find(params[:article_id])
      end
      
      def require_comment_user
        if !logged_in?
          flash[:danger] = "You must be logged in to post a comment"
          redirect_to :back
        end
      end
      
     
end
