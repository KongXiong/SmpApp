class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper



private

  def authorize
    redirect_to login_url, alert: "You are not authorized" if current_user.nil?
  end

end
