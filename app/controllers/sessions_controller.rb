class SessionsController < ApplicationController
  def new

  end
  def create
    if user = User.authenticate(params[:email_or_username], params[:password])
      session[:user_id] = user.id
      redirect_to user
      flash[:notice] = "Welcome back, #{user.name}!"
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
    end
  end
end
