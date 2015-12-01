class ProductsController < ApplicationController

  def index
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end

    @products      = Product.all
  end

  def show
    @product       = Product.find(params[:product_id])
  end

  def admin
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end

    @products      = Product.all
  end

  def new

  end

  def add

  end

end
