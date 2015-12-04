class AddSmallImageUrlToProducts < ActiveRecord::Migration
  def change
    add_column :products, :small_image_url, :string
  end
end
