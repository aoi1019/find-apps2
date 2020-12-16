class UsersController < ApplicationController
  before_action :search_word, only: [:index, :school]

  def index
    @users = User.all.order('created_at DESC').search(params[:keyword])
  end

  def show
    @user = User.find(params[:id])
    @apps = @user.apps
  end

  def school
    @user = User.find_by(school_id: params[:id])
    @users = User.where(school_id: params[:id]).order('created_at DESC')
  end

  private

  def search_word
    @search_word = params[:keyword]
  end
end
