# frozen_string_literal: true

module SessionsHelper
  def social_buttons
    link_to('Log in with Facebook',
            '/auth/facebook',
            class: 'btn btn__login btn__login--facebook') +
      link_to('Log in with Google',
              '/auth/facebook',
              class: 'btn btn__login btn__login--google')
  end
end
