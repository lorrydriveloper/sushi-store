# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  render :'sessions/new.html.erb'
  end

  def create

    @user = User.first_or_create(email: auth['email']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.avatar = auth['info']['image']
      u.password = SecureRandom.hex
    end
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
  

  private

  def auth
    request.env['omniauth.auth']
  end
end
