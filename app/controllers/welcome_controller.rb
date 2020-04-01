class WelcomeController < ApplicationController



  def index
    @categories = Category.all 
    @category = Category.find_by(name:'popular')
    @items = Item.all
  end
end
