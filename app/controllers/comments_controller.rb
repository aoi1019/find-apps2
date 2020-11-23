class CommentsController < ApplicationController
  def create
    if comment = Comment.create(comment_params)
      flash[:notice] = "コメントしました"
      redirect_to "/apps/#{comment.app.id}"
    else
      flash[:alert] = "コメントできません"
    end
  end

  def destroy
    @comment = Comment.find(params[:app_id])
    @app = @comment.app
    if current_user.id = @comment.user_id 
      @comment.destroy
      flash[:notice] = "コメントを削除しました"
      redirect_to app_path(@app)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id, app_id: params[:app_id])
    end
end
