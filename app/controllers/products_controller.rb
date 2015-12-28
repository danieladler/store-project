class ProductsController < ApplicationController

  def index
    # REVIEW: Since these two `if`s share one result, they can be on the same
    #         line combined with `&&`
    if @current_user
      if @current_user.username == "admin"
        redirect_to admin_products_path
      end
    end
    @products      = Product.all
  end

  def show
    @product         = Product.find(params[:product_id])
    @product_options = Product.find(params[:product_id]).product_options.all
    @product_option  = ProductOption.new
  end

  def add
    @product               = Product.new
    @product.name          = params[:product][:name]
    @product.description   = params[:product][:description]
    # REVIEW: The `image_url` isn't being set here, which means that it isn't
    #         added to the db, and has to be added in the edit page
    if @product.save
      redirect_to edit_view_path(@product.id)
    else
      @products            = Product.all
      render :products
    end
  end

  def edit
    @product             = Product.find(params[:product_id])
    @product.name        = params[:product][:name]
    @product.description = params[:product][:description]
    @product.image_url   = params[:product][:image_url]
    @product.save
    redirect_to edit_view_path
  end

  def delete
    @product       = Product.find(params[:product_id])
    @product.destroy
    redirect_to admin_products_path
  end

end
