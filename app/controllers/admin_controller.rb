class AdminController < ApplicationController

  def index
    @products       = Product.all
  end

  def new
    @product               = Product.new
  end

  def edit_view
    @product         = Product.find(params[:product_id])
    @product_options = Product.find(params[:product_id]).product_options.all
    @product_option  = ProductOption.new
  end

  def edit
    @product              = Product.find(params[:product_id])
    @product.name         = params[:product][:name]
    @product.description  = params[:product][:description]
    @product.save
    redirect_to show_product_path
  end

end
