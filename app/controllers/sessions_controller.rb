# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
    # for unknown reason it does pick the proper view
    render :'sessions/new.html.erb'
  end

  def create
    @user = User.find_or_create_by(email: auth['info']['email']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.avatar = auth['info']['image']
      u.password = SecureRandom.hex
    end
    flash[:success] = "Welcome to Sushi to You #{@user.name}"
    session[:user_id] = @user.id
    redirect_to(@user.admin ? admin_dashboard_path : root_path)
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
