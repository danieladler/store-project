class ProductOption < ActiveRecord::Base
  validates :price_in_cents, presence: true, numericality: true
  validates :name, presence: true

  belongs_to :product
  has_many   :items
end
