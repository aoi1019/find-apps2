class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @app = App.find(params[:app_id])
    @user = @app.user
    @comment = @app.comments.new(comment_params)
    if @comment.save
      flash[:notice] = 'コメントしました'
      redirect_to "/apps/#{@comment.app.id}"
      if @user != current_user
        @user.notifications.create(from_user_id: current_user.id, variety: 2, content: @comment.content, app_id: @app.id)
        @user.update_attribute(:notification, true)
      end
    else
      flash[:alert] = 'コメントできません'
    end
  end

  def destroy
    @comment = Comment.find(params[:app_id])
    @app = @comment.app
    if current_user.id == @comment.user_id
      @comment.destroy
      flash[:notice] = 'コメントを削除しました'
      redirect_to app_path(@app)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, app_id: params[:app_id])
  end
end
