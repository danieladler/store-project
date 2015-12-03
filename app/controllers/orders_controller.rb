class OrdersController < ApplicationController

  def index
    set_current_user
    @orders = Order.all
  end

end
