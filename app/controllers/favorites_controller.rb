class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites.order('created_at DESC')
  end

  def create
    @app = App.find(params[:app_id])
    @user = @app.user
    current_user.favorite(@app)
    respond_to do |f|
      f.html { redirect_back(fallback_location: app_path(@app)) }
      f.js
    end
  end

  def destroy
    @app = App.find(params[:app_id])
    current_user.favorites.find_by(app_id: @app.id).destroy
    respond_to do |f|
      f.html { redirect_back(fallback_location: app_path(@app)) }
      f.js
    end
  end
end
