class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def cart
    @current_order.total = @current_order.calculate_total
    @current_order.save
  end

  def checkout

  end

  def finish_checkout
    @current_order.user_id          = session[:user_id]
    @current_order.name             = params[:order][:name]
    @current_order.shipping_address = params[:order][:shipping_address]
    @current_order.status           = "paid"
    # REVIEW: These checks would be best as validations, look into conditional
    #         validations for how to scope it to `paid` orders
    if @current_order.name.empty? || @current_order.shipping_address.empty?
      flash.now[:notice]="Include both name and address to complete checkout"
      @current_order                = Order.find(params[:order_id])
      render :checkout
    else
      @current_order.save
      session.delete(:order_id)
      redirect_to order_confirm_path(params[:order_id]), notice: "Your order has been placed!"
    end
  end

  def confirm
    @complete_order = Order.find(params[:order_id])
  end

  def ship_confirm
    @current_order = Order.find(params[:order_id])
    @current_order.status           = "shipped"
    @current_order.save
    redirect_to orders_path
  end

end
