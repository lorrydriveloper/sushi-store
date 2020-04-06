# frozen_string_literal: true

module UsersHelper
  def login_logout
    if current_user.id
      link_to('Logout', logout_path, class: 'navigation__link')
    else
       link_to('Login', login_path, class: 'navigation__link')
    end
  end

  def user_account
    content_tag :li, class:"navigation__item" do
      link_to 'user account', edit_user_path(current_user), class: 'navigation__link'
    end if current_user.id
  end

  def finish_edit
    current_user.name ? 'Edit Account' : 'Finish Account'
  end
end
