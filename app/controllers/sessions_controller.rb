class SessionsController < ApplicationController
  # skip_before_action :authorized, only: %i[new create welcome]

  def new
    # @session = Session.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out!'
  end

  def login; end

  def welcome; end
end
