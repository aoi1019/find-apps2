class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
    @apps = App.includes(:user).order('created_at DESC').page(params[:page]).per(12).search(params[:keyword])
    @search_word = params[:keyword]
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)
    if @app.save
      flash[:notice] = '投稿が完了しました！'
      redirect_to root_path
    else
      flash[:alert] = '投稿できませんでした'
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @app.comments.includes(:user)
  end

  def edit
    redirect_to root_path unless current_user.id == @app.user_id
  end

  def update
    if @app.update(app_params)
      flash[:notice] = '編集が完了しました！'
      redirect_to root_path
    else
      flash[:alert] = '編集できませんでした'
      render :edit
    end
  end
  

  def destroy
    @app.destroy
    flash[:notice] = '削除が完了しました！'
    redirect_to root_path
  end

  private

  def app_params
    params.require(:app).permit(:name, :description, :reference, :point, :language, :period, :image).merge(user_id: current_user.id)
  end

  def set_app
    @app = App.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
