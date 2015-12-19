class ItemsController < ApplicationController

  def add_to_cart
    set_current_user
    set_current_order
      # test if the order already contains one (or more) of this item *with this product option id*
      if @current_order.items.exists?(product_option_id: params[:selector])
          # if so, grab the item object with the matching product option id
          @matched_item = @current_order.items.find_by(product_option_id: params[:selector])
          # increase quantity of matching item by 1
          @matched_item.quantity += 1
          # save the matching item
          @matched_item.save
      # otherwise, create a new item with quantity of 1
      else
        @item = Item.new
        @item.product_option_id = params[:selector]
        @item.price             = @item.product_option.price_in_cents
        @item.order_id          = session[:order_id]
        @item.quantity          = 1
        @item.save
      end
    if session[:user_id]
      redirect_to user_cart_path(session[:user_id])
    else
      redirect_to home_path
    end
  end

  def remove_from_cart
    @item = Item.find(params[:item_id])
    @item.destroy
    redirect_to user_cart_path(session[:user_id])
  end

end
