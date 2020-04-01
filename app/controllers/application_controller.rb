# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_user, :cart

  private
  
  def cart 
   session[:cart] ||= session[:cart] = {}
  end

  def current_user
    @user = (User.find_by_id(session[:user_id]) || User.new)
  end

  def logged_in?
    !!current_user.id
  end

  def require_logged_in
    redirect_to login_path unless logged_in?
  end

  helper_method :current_user
end
