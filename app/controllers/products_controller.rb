class ProductsController < ApplicationController

  def index
    set_current_user

    if @current_user
      if @current_user.email == "admin"
        redirect_to admin_products_path
      end
    end

    @products      = Product.all
  end

  def show
    set_current_user
    @product         = Product.find(params[:product_id])
    @product_options = Product.find(params[:product_id]).product_options.all
    @product_option  = ProductOption.new
  end

  def add
    @product               = Product.new
    @product.name          = params[:product][:name]
    @product.description   = params[:product][:description]
    if @product.save
      redirect_to admin_products_path
    else
      @products            = Product.all
      render :products
    end
  end

  def delete
    @product       = Product.find(params[:product_id])
    @product.destroy
    redirect_to admin_products_path
  end

end
