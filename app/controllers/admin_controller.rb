class AdminController < ApplicationController

  def index
    @products       = Product.all
  end

  def new
    # REVIEW: Since this isn't being aligned anything, just keep a single space before the `=`
    @product               = Product.new
  end

  def edit_view
    @product         = Product.find(params[:product_id])
    # REVIEW: Here since @product has already been found you can just do
    #                  @product.product_options
    #         And the `.all` isn't needed, that is just assumed
    @product_options = Product.find(params[:product_id]).product_options.all
    @product_option  = ProductOption.new
  end

  def edit
    @product              = Product.find(params[:product_id])
    # REVIEW: Using the `.update(params.require(:product).permit(:name, :description))`
    #         is going to be a good way to do this in one line.
    @product.name         = params[:product][:name]
    @product.description  = params[:product][:description]
    @product.save
    redirect_to show_product_path
  end

end
