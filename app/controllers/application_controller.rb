class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :require_user, :is_admin?

  def logged_in?
    current_user != nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def require_user
    redirect_to root_path, :alert => t('errors.messages.not_logged_in') unless current_user
  end
  
  def is_admin?
    return false if current_user == nil
    return current_user.is_admin
  end
  
end
