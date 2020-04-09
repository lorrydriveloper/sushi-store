# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by_auth(auth)
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
