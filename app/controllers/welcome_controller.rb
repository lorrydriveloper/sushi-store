# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @categories = Category.all
    @category = @categories.first
    @items = @category&.items
  end
end
