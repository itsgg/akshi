class ApplicationController < ActionController::Base
  include Pagy::Backend
  helper_method :current_user, :logged_in?, :admin?
  before_action :load_admin_js

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    # User no longer available in the system
    session[:user_id] = nil
  end

  def logged_in?
    current_user.present?
  end

  def admin?
    logged_in? && current_user.admin?
  end

  def load_admin_js
    js 'Admin' if admin?
  end

  def require_login
    return if logged_in?

    flash[:alert] = 'Login required'
    redirect_back fallback_location: root_path
  end

  def require_admin
    return if admin?

    flash[:alert] = 'Access denied'
    redirect_back fallback_location: root_path
  end
end
