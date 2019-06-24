class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      flash[:success] = "Successful Login"
      log_in user
      redirect_to user
    else 
      flash.now[:danger] = "Invalid login"
      render 'new'
    end
  end

  def destroy 
    log_out if logged_in?
    redirect_to root_url
  end
end
