# frozen_string_literal: true

module Admin
  class ItemsController < AdminController
    before_action :find_item, except: %i[index new create]

    def index 
      @items = Item.all
    end
    def show; end

    def new
      @category = Category.find(params[:category_id])
      @item = Item.new.tap { |i| i.category = @category }
    end

    def edit
      @category = Category.find(params[:category_id])
    end

    def create
      @item = Item.new(item_params)
      if @item.save
        flash[:success] = 'Item successfully created'
        redirect_to admin_category_path @item.category
      else
        flash[:error] = 'Something went wrong'
        render 'new'
      end
    end

    def update
      if @item.update_attributes(item_params)
        flash[:success] = 'Item was successfully updated'
        redirect_to admin_category_path @item.category
      else
        flash[:error] = 'Something went wrong'
        render 'edit'
      end
    end

    def destroy
      if @item.destroy
        flash[:success] = 'Item was successfully deleted'
      else
        flash[:error] = 'Something went wrong'
      end
      redirect_to admin_category_path(@item.category)
    end

    private

    def item_params
      img_upload(params)
      params.require(:item).permit(:name, :pieces, :price, :image, :description, :category_id)
    end

    def img_upload(params)
      img = Cloudinary::Uploader.upload(params[:item][:image])
      params[:item][:image] = img['url']
    end
    def find_item
      @item = Item.find(params[:id])
    end
  end
end
