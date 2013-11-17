class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_is_admin?
    if current_user
      if current_user.name == "Admin"
        true
      end
    else
      false
    end
  end

  helper_method :current_user   #allows this method to be used in views
  helper_method :user_is_admin?
end
