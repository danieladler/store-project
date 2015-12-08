class ItemsController < ApplicationController

  def add_to_cart
    set_current_user
    set_current_order
    @item                   = Item.new
    @item.product_option_id = params[:selector]
    @item.price             = @item.product_option.price_in_cents
    @item.order_id          = session[:order_id]
    @item.quantity          = 1
    @item.save
    redirect_to user_cart_path(session[:user_id])
  end

end
