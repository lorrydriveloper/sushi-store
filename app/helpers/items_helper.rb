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
end
