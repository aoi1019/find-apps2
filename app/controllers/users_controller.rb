class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @apps = @user.apps
  end
end
