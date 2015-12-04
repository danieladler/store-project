class OrdersController < ApplicationController

  def index
    set_current_user
    @orders = Order.all
  end

  def cart
    set_current_user
    @user_orders = @current_user.orders
  end

  def checkout
    set_current_user

  end

end
