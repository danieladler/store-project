class ItemsController < ApplicationController

  # 12/4
  belongs_to: :product_option
  belongs_to: :order

end
