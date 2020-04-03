class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
 


  def calculate_total 
    total = 0

    self.items.each do |item|
      total += item.price
    end

    self.total = total


  end
end
