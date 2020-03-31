class WelcomeController < ApplicationController



  def index

    @categories = Category.all 

    @popular = Item.all


  end
end
