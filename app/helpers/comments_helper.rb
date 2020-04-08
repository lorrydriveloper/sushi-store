# frozen_string_literal: true

module CommentsHelper
  def crud_buttons(comment)
    if belong_to_user?(comment)
      link_to('edit',
              edit_item_comment_path(comment.item, comment),
              class: 'btn btn-crud btn-crud--edit') +
        button_to('delete', item_comment_path(comment.item, comment),
                  class: 'btn btn-crud btn-crud--delete display-hack',
                  method: :delete)
    end
  end

  def comment_by(comment)
    "Commented by #{comment.user.name} #{time_ago_in_words(comment.created_at)} ago"
  end
end
