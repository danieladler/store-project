class ProductsController < ApplicationController

  def index
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end

    @products      = Product.all
    # raise
  end

  def show
    @product       = Product.find(params[:product_id])
  end

  def admin
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end

    @products       = Product.all
  end

  def new
    @product               = Product.new
  end

  def add
    @product               = Product.new
    @product.name          = params[:product][:name]
    @product.description   = params[:product][:description]
    if @product.save
      redirect_to products_path
    else
      @products            = Product.all
      render :products
    end
  end

end
