# frozen_string_literal: true

module OrdersHelper
  def total(quantity, item)
    (quantity.to_i * item.price).round(2)
  end

  def list_orders(array_of_hashes)
    array_of_hashes.each do |hash|
      hash.each do |quantity, item|
        content_for :list do
          if quantity.to_i.positive?
            content_tag :div, class: 'checkout__item' do
              content_tag(:h3, "#{quantity} X #{item.name} at £ #{item.price}") +
                long_h3(item, quantity)
            end
          end
        end
      end
    end
    content_for :list
  end

  private

  def long_h3(item, quantity)
    content_tag(:h3) do
      content_tag(:span, 'Total: £') +
        content_tag(:span, total(quantity, item), class: 'item_total') +
        link_to('Modify', item_path(item), class: 'btn btn--modify')
    end
  end
end
