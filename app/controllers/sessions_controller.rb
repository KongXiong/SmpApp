class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Successfully Logged in"
      redirect_to user
    else
      flash.now[:danger] = "Email or pass is invalid"
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:notice] = "Logged Out"
    redirect_to root_url
  end

end
