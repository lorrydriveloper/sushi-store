# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.find_by(name: 'popular')
    @items = @category.items
  end
end
