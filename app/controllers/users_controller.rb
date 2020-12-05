class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at DESC').search(params[:keyword])
    @search_word = params[:keyword]
  end

  def show
    @user = User.find(params[:id])
    @apps = @user.apps
  end
end
