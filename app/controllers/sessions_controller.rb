class SessionsController < ApplicationController
  
  def login_form
  end
  
  def login
    if params[:username].present? && params[:password].present?
      user = User.find_by(username: params[:username], password: params[:password])
      if user
        log_in_user(user)
        redirect_to home_path, notice: 'logged in'
      else
        redirect_to login_form_path, notice: 'incorrect username or password'
      end
    end
  end
    
    def logout
      session[:user_id] = nil
      redirect_to home_path, notice: 'logged out'
    end
        
end

