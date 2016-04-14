class CategoriesController < ApplicationController
  def index 
    @categories = Category.all
  end 
  
  def show 
    @category = Category.find_by(id: params[:id])
    if @category.nil?
      redirect_to categories_path
    end
  end
end
