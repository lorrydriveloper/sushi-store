# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.first
    @items = @category&.items
  end
end
