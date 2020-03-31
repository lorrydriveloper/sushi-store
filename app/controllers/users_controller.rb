# frozen_string_literal: true

class UsersController < ApplicationController
  
  def create
    @user = User.find_or_create_by(email: user_params[:email])

    if @user.valid?
      if @user.try(:authenticate, user_params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Welcome back #{@user.name}"
        redirect_to root_path
      else
        flash[:error] = 'Password do not match try to login via Facebook'
        redirect_to login_path
      end
    else
      @user.password = user_params[:password]

      if @user.save
        flash[:success] = "Welcome To Shushi to You #{@user.name}"
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash[:error] = 'Something went wrong try again or try to login via Facebook'
        redirect_to login_path
      end

    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :address, :avatar)
  end
end
