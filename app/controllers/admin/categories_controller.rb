class Admin::CategoriesController < ApplicationController
    
    def index
      @categories = Category.all
    end

    def show
      @category = Category.find(params[:id])
      @items = @category.items
    end



    def new
      @category = Category.new
      render 'new'
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        flash[:success] = "Category successfully created"
        redirect_to admin_categories_path
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
    end

    def edit
      @category = Category.find(params[:id])
    end
    

    def update
      @category = Category.find(params[:id])
        if @category.update_attributes(category_params)
          flash[:success] = "Category was successfully updated"
          redirect_to admin_categories_path
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
      @categoy = Category.find(params[:id])
      if @categoy.destroy
        flash[:success] = 'Category was successfully deleted.'
        redirect_to admin_categories_path
      else
        flash[:error] = 'Something went wrong'
        redirect_to admin_dashboard_path
      end
    end
    
    
    
    private

    def category_params
      params.require(:category).permit(:name, :icon)
    end
  

end