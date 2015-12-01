class ProductsController < ApplicationController

  def index
    @products      = Product.all
    # raise
  end

  def show
    @product       = Product.find(params[:product_id])
  end

end
