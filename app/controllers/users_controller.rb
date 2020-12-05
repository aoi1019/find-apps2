class UsersController < ApplicationController

  def index
    @users = User.all.order('created_at DESC').search(params[:keyword])
    @search_word = params[:keyword]

    # @school = School.where.not(id: 1)
    # set_column
    # @school_name = params[:school]
    # @results = User.where('school_id IN(?)', params[:school_id])
  end

  def show
    @user = User.find(params[:id])
    @apps = @user.apps
  end

  # private
  #   def set_column
  #     @school_name = School.name
  #   end
end
