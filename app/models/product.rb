class Product < ActiveRecord::Base

  has_many :product_options

  def standard_price
    sprintf('%.2f', self.product_options.find_by(name:"standard price").price_in_cents.to_f/100.to_f)
  end

end
