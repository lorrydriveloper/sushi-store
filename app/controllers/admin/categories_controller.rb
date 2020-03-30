class Admin::CategoriesController < ApplicationController
    
    def new
      @category = Category.new
      render 'new'
    end

    def create
      @category = Category.new(params[:category])
      if @category.save
        flash[:success] = "Category successfully created"
        redirect_to @category
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
    end

    def edit
      @category = Categoy.find()
    end
    

    def update
      @category = Category.find(params[:id])
        if @category.update_attributes(params[:category])
          flash[:success] = "Category was successfully updated"
          redirect_to @category
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
      @categoy = Category.find(params[:id])
      if @categoy.destroy
        flash[:success] = 'Category was successfully deleted.'
        redirect_to categoys_url
      else
        flash[:error] = 'Something went wrong'
        redirect_to categoys_url
      end
    end
    
    
    
    
  end
  

end