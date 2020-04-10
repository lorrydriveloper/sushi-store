# frozen_string_literal: true

module ItemsHelper
  def items_in_cart(id)
    session[:cart][id.to_s] || '1'
  end

  def items_crud_buttons(item)
    content_tag :div, class: 'buttons' do
      link_to('edit', edit_admin_category_item_path(item.category, item),
              class: 'btn btn-crud btn-crud--edit') +
        link_to('show', item_path(item), class: 'btn btn-crud btn-crud--show') +
        button_to('destroy', admin_category_item_path(item.category, item),
                  class: 'btn btn-crud btn-crud--delete', method: :delete)
    end
  end

  def list_items(items)
    items.map do |item|
      content_for :list do
      content_tag :div, class: 'category-container' do
        content_tag(:h2, item.name, class: 'small-font') +
          items_crud_buttons(item)
      end
    end
  end
  content_for :list
  end
end
