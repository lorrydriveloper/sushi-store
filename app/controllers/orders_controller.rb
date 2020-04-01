# frozen_string_literal: true

class OrdersController < ApplicationController

  def create
    add_to_cart(params)
    redirect_to root_path
  end

  private

  def add_to_cart(params)
    session[:cart] ||= session[:cart] = {}
    session[:cart][params[:item][:id]] = params[:item][:quantity]
    session[:quantity] = session[:cart].values.map(&:to_i).sum
  end
end
