class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?

  def current_user    
    User.find_by(id: session[:user_id])  
  end

  def logged_in?  
    !current_user.nil?  
  end

  def authorized
   redirect_to '/welcome' unless logged_in?
  end

  private
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end
end
