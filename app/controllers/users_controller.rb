class UsersController < ApplicationController

  def create
    @user               = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    @user.save
    session[:user_id] = @user.id
    redirect_to home_path
  end

  def show
    set_current_user
    set_current_order
  end

end
