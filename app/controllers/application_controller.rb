class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def set_current_order
    if session[:order_id]
      @current_order = Order.find(session[:order_id])
    else
      @current_order               = Order.new
      @current_order.status        = "browsing"
      @current_order.save
      session[:order_id] = @current_order.id
    end
  end

  before_action :set_current_user
  before_action :set_current_order
end
