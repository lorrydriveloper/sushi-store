# frozen_string_literal: true

module Admin
  class OrdersController < AdminController
    def index
      @orders = Order.last_orders
    end
  end
end