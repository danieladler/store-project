class AdminController < ApplicationController

  def index
    # set_current_user
    @products       = Product.all
  end

  def new
    # set_current_user
    @product               = Product.new
  end

  def edit_view
    # set_current_user
    @product         = Product.find(params[:product_id])
    @product_options = Product.find(params[:product_id]).product_options.all
    @product_option  = ProductOption.new
  end

  def edit
    # set_current_user
    @product              = Product.find(params[:product_id])
    @product.name         = params[:product][:name]
    @product.description  = params[:product][:description]
    @product.save
    redirect_to show_product_path
  end

end
