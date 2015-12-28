class Product < ActiveRecord::Base

  has_many :product_options
  has_many :items, through: :product_options

  def standard_price
    # REVIEW: Since this method may be used multiple times in a view it would be
    #         best to memoize it with @standard_price ||= ...
    #         Just so that it doesn't have to do the find in the db everytime the method  is used.
    if self.product_options.find_by("LOWER(name) = ?", "standard price")
      sprintf('%.2f', self.product_options.find_by("LOWER(name) = ?", "standard price").price_in_cents.to_f/100.to_f)
    end
  end

end
