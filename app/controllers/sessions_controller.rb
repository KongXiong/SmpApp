class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = "Successfully Logged in"
      redirect_back_or user
    else
      flash.now[:danger] = "Email or pass is invalid"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:notice] = "Logged Out"
    redirect_to root_url
  end

end
