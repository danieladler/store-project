class ItemsController < ApplicationController

  def add_to_cart
    set_current_user
    set_current_order
    @item                   = Item.new
    # set other Item attributes via params or form
    # @item.product_option_id = ???
    @item.order_id          = session[:order_id]
    @item.save
    redirect_to user_cart_path(session[:user_id])
  end

end
