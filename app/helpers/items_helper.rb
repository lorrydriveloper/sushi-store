module ItemsHelper

  def items_in_cart(id)
    session[:cart][id.to_s] || '1'
  end
end
