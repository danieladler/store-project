class Order < ActiveRecord::Base
  has_many :items
  belongs_to :user

  def calculate_total
    total_order_cost = 0
    self.items.each do |i|
      total_order_cost += (i.price * i.quantity)
    end
    total_order_cost
  end

  def calculate_total_items
    total_items = 0
    self.items.each do |i|
      total_items += i.quantity
    end
    total_items
  end

  def purchased_date
    self.updated_at.localtime.strftime("%B %e, %Y")
  end

  def purchased_time
    self.updated_at.localtime.strftime("%I:%M:%S %p %Z")
  end

end
