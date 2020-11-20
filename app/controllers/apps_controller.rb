class AppsController < ApplicationController
  def index
    @apps = App.includes(:user).order("created_at DESC")
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)
    if @app.save
      flash[:notice] = "投稿が完了しました！"
      redirect_to root_path
    else
      flash[:alert] = "投稿できませんでした"
      render :new
    end
  end

  private
    def app_params
      params.require(:app).permit(:name, :description, :reference, :point, :language, :period, :image).merge(user_id: current_user.id)
    end
end
