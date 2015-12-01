class UsersController < ApplicationController

  def create
    @user               = User.new
    @user.email         = params[:user][:email]
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

end
