# frozen_string_literal: true

module Admin
  class CategoriesController < AdminController
    before_action :find_category, except: %i[index new]

    def index
      @categories = Category.all
    end

    def show
      @items = @category.items
    end

    def new
      @category = Category.new
      render 'new'
    end

    def create
      if @category.save
        flash[:success] = 'Category successfully created'
        redirect_to admin_categories_path
      else
        flash[:error] = 'Something went wrong'
        render 'new'
      end
    end

    def edit; end

    def update
      if @category.update_attributes(category_params)
        flash[:success] = 'Category was successfully updated'
        redirect_to admin_categories_path
      else
        flash[:error] = 'Something went wrong'
        render 'edit'
      end
    end

    def destroy
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

    def find_category
      @category = Category.find(params[:id])
    end
  end
end
