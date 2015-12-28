class SessionsController < ApplicationController

  def sign_in
    @user = User.find_by(username: params[:username])
    # REVIEW: `.nil?` is helpful. And since the `if` and `else` have the same result
    #         they could be combined into a single conditional
    if @user == nil
      redirect_to home_path, notice: "Wrong username or password"
    elsif @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to home_path, notice: "Wrong username or password"
    end
  end

  def sign_out
    session.delete(:user_id)
    redirect_to "/"
  end

end
