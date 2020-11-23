class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    flash[:notice] = "コメントしました"
    redirect_to "/apps/#{comment.app.id}"
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to "/apps/#{comment.app.id}"
  end

  private
    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id, app_id: params[:app_id])
    end
end
