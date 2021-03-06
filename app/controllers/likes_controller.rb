class LikesController < ApplicationController
  before_action :set_app, only: [:create, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @user = @app.user
    current_user.like(@app)
    respond_to do |f|
      f.html { redirect_back(fallback_location: app_path(@app)) }
      f.js
    end
    if @user != current_user
      @user.notifications.create(app_id: @app.id, from_user_id: current_user.id, variety: 1)
      @user.update_attribute(:notification, true)
    end
  end

  def destroy
    current_user.likes.find_by(app_id: @app.id).destroy
    respond_to do |f|
      f.html { redirect_back(fallback_location: app_path(@app)) }
      f.js
    end
  end

  private

  def set_app
    @app = App.find(params[:app_id])
  end
end
