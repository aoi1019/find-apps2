class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.order("created_at DESC")
    current_user.update_attribute(:notification, false)
  end
end
