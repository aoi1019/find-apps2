class UsersController < ApplicationController

  def show
    @name = current_user.name
    @apps = current_user.apps
  end
end
