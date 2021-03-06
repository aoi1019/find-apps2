class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :school_id])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :school_id, :image, :twitter, :qiita])
  end
end
