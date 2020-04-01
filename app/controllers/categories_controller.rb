# frozen_string_literal: true

class CategoriesController < ApplicationController
 
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @items = @category.items
  end
end
