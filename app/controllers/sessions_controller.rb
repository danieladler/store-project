class SessionsController < ApplicationController

  def sign_in
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to home_path
    end
  end

  def sign_out
    session.delete(:user_id)
    redirect_to "/"
  end

end
