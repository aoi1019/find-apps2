class LikesController < ApplicationController
  before_action :set_app, only: [:create, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    like = Like.create(user_id: current_user.id, app_id: @app.id)
  end

  def destroy
    like = Like.destroy(user_id: current_user.id, app_id: @app.id)
  end

  private
    def set_app
      @app = App.find(paramd[:id])
    end
end
