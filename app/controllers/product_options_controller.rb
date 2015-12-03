class ProductOptionsController < ApplicationController

  def add
    @product_option                  = ProductOption.new
    @product_option.name             = params[:product_option][:name]
    @product_option.price_in_cents   = params[:product_option][:price_in_cents]
    @product_option.product_id       = params[:product_id]
    if @product_option.save
      redirect_to edit_view_path
    else
      # not sure about this part
      @product_options            = ProductOption.all
      render :products
    end
  end

  def edit
    @product_option              = ProductOptionfind(params[:product_option_id])
    @product_option.name             = params[:product_option][:name]
    @product_option.price_in_cents   = params[:product_option][:price_in_cents]
    @product_option.product_id       = params[:product_option][:product_id]
    if @product_option.save
      redirect_to edit_view_path
    else
      # not sure about this part
      @product_options            = ProductOption.all
      render :products
    end
  end

  def delete
    @product_option                = ProductOptionfind(params[:product_option_id])
    @product_option.destroy
    redirect_to admin_products_path
  end

end
