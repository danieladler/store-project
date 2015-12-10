class OrdersController < ApplicationController

  def index
    set_current_user
    @orders = Order.all
  end

  def cart
    set_current_user
    set_current_order
    @current_order.total = @current_order.calculate_total
  end

  def checkout
    set_current_user
    set_current_order
    @current_order.save
  end

  def finish_checkout
    set_current_order
    set_current_user
    @current_order.user_id          = session[:user_id]
    @current_order.name             = params[:order][:name]
    @current_order.shipping_address = params[:order][:shipping_address]
    @current_order.status           = "paid"
    @current_order.save
    session.delete(:order_id)
    redirect_to order_confirm_path(params[:order_id])
  end

  def confirm
    set_current_user
    @complete_order = Order.find(params[:order_id])
  end

  def ship_confirm
    @current_order = Order.find(params[:order_id])
    @current_order.status           = "shipped"
    @current_order.save
    redirect_to orders_path
  end


end
