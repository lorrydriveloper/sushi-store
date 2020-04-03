module OrdersHelper

  def total(quantity, item)
   (quantity.to_i * item.price).round(2)
  end
end
