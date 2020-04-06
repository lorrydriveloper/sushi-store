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
        flash[:success] = "Welcome To Shushi to You please finish your profile."
        session[:user_id] = @user.id
        redirect_to edit_user_path(@user)
      else
        flash[:error] = "#{@user.errors.full_messages.first} try again or Login with Social Media"
        redirect_to login_path
      end

    end
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
      if user.update_attributes(user_params)
        flash[:success] = "Your Account has been succesful updated"
      else
        flash[:error] = "Something went wrong"
      end
      redirect_to edit_user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :address, :avatar)
  end
end
