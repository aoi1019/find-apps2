class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/apps/#{comment.app.id}"
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id, app_id: params[:app_id])
    end
end
