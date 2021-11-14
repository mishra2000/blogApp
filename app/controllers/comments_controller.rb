class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    if comment_params["user_id"].to_s==current_user.id.to_s
      @comment = @article.comments.create(comment_params)
    end
    redirect_to article_path(@article)
  end
  def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      if @comment.user_id === current_user.id
        @comment.destroy
        redirect_to article_path(@article)
      else
        redirect_to article_path(@article),notice: "not authorised"
      end
    end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body,:user_id)
    end
end
