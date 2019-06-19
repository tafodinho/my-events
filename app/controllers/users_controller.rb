class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    if @user.save 
      flash[:success] = "User created successfuly"
      redirect_to @user
    else 
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @prev_events = @user.previous_events
    @upcoming = @user.upcoming_events
  end

  private 
    def user_params 
      params.require(:user).permit(:name, :email, :password, :password_confirmaton)
    end
end
