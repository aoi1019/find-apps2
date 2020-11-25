class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @name = current_user.name
    @apps = current_user.apps
  end
end
