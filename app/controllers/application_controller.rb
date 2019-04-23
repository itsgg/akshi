class ApplicationController < ActionController::Base
  include Pagy::Backend
  helper_method :current_user, :logged_in?, :admin?

  protected

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in?
    current_user.present?
  end

  def admin?
    logged_in? && current_user.admin?
  end
end
