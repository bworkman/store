class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :user_signed_in?, :current_user
  
  def authenticate_user!
  end
  
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  
  def user_signed_in?
    if current_user
      true
    else
      false
    end
  end
  
  def log_in_user(user)
    session[:user_id] = user.id
  end
  
end
