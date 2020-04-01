class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    render action: 'show.html.erb'
  end
  
end
