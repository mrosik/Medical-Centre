class SessionsController < ApplicationController
  before_filter :authorize, :only => [:destroy]

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
        cookies[:auth_token] = user.auth_token
        if current_user.admin
          redirect_to appointments_path, :notice => "logged in"
        else
          redirect_to site_home_path, :notice => "logged in"
        end
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end
end
