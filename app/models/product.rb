class Product < ActiveRecord::Base

  has_many :product_options
  has_many :items, through: :product_options

  def standard_price
    if self.product_options.find_by("LOWER(name) = ?", "standard price")
      sprintf('%.2f', self.product_options.find_by("LOWER(name) = ?", "standard price").price_in_cents.to_f/100.to_f)
    end
  end

end
