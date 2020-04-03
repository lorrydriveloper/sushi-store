module OrdersHelper

  def total(quantity, item)
   quantity.to_i * item.price
  end
end
