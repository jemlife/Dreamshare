class CategoriesController < ApplicationController
  def new
    @category  = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    @category.save
  end






private
  def category_params
    params.require(:category).permit(:name, :entry_id)
  end

end
