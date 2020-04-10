# frozen_string_literal: true

module CategoriesHelper
  def category_crud_buttons(category)
    content_tag :div, class: 'buttons' do
      link_to('edit', edit_admin_category_path(category), 
      class: ' btn btn-crud btn-crud--edit') +
        link_to('show', admin_category_path(category), 
        class: 'btn btn-crud btn-crud--show') +
        button_to('destroy', admin_category_path(category), 
        method: 'delete', class: 'btn btn-crud btn-crud--delete')
    end
  end
end
