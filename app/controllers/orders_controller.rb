# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :require_logged_in, only: %i[show]

  def show
    @order_hash = order_hash
    @order = current_user.orders.build
  end

  def create
    if params[:commit] == 'Add to cart'
      add_to_cart(params)
    else
      place_order(params[:order], session[:cart])
      flash[:success] = 'Thanks Your Order is on its Way'
    end
    redirect_to root_path
  end

  private

  def add_to_cart(params)
    session[:cart] ||= session[:cart] = {}
    session[:cart][params[:item][:id]] = params[:item][:quantity]
    session[:quantity] = session[:cart].values.map(&:to_i).sum
  end

  def order_hash
    session[:cart].collect do |k, v|
      { v => Item.find(k) }
    end
  end
  # it need to rethink and refactor this is ugly.
  def place_order(_params, cart)
    user = current_user
    ids = array_ids(cart)
    order = user.orders.build
    order.item_ids = ids
    order.status = 'Ordered'
    order.calculate_total
    session.delete(:cart)
    session.delete(:quantity)
    user.save
  end

  def array_ids(hash)
    hash.collect do |k, v|
      a = []
      v.to_i.times { a.push(k) }
      a
    end.flatten
  end
end
