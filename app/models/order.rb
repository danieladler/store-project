class Order < ActiveRecord::Base

  has_many :items
  belongs_to :user

  def calculate_total
    total_order_cost = 0
    self.items.each do |i|
      total_order_cost += i.price
    end
    total_order_cost
  end

end
