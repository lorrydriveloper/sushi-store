# frozen_string_literal: true

class SessionsController < ApplicationController
  def create

    @user = User.first_or_create(email: auth['email']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.avatar = auth['info']['image']
      u.password = SecureRandom.hex
    end

    session[:user_id] = @user.id
  end

  private

  def auth
    request.env['omniauth.auth']
  end


end
