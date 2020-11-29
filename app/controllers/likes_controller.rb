class LikesController < ApplicationController

  def create
    @app = App.find(params[:id])
    like = Like.create(user_id: current_user.id, app_id: @app.id)
  end
end
