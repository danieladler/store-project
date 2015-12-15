class UsersController < ApplicationController

  def sign_up
    set_current_user
  end


  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    else
      render :sign_up
    end

  end

  def show
    set_current_user
    set_current_order
  end

end
