# frozen_string_literal: true

module CommentsHelper
  def crud_buttons(comment)
    if belong_to_user?(comment)
      link_to('edit', edit_item_comment_path(comment.item, comment)) +
        button_to('delete', item_comment_path(comment.item, comment), method: :delete)
    end
  end
end
