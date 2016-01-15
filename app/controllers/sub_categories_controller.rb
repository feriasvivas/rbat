class SubCategoriesController < ApplicationController

  before_filter :category_exists, :only => [:new, :create]

  protected
  def category_exists
    unless (@category = Category.find_by_id(params[:category_id]))
      redirect_to categories_path
    end
  end

  public
  def new
    @sub_category = @category.sub_categories.build
  end

  def create
    @category.sub_categories.create(sub_category_params)
    redirect_to category_path(@category)
  end

  def edit
    @sub_category = SubCategory.find(params[:id])
  end

  def update
    @sub_category = SubCategory.find(params[:id])
    if @sub_category.update_attributes(sub_category_params)
      redirect_to category_path(@sub_category.category)
    else
      render 'edit'
    end
  end

  def destroy
    @sub_category = SubCategory.find(params[:id])
    @sub_category.delete
    redirect_to category_path(params[:category_id])
  end

  private
  def sub_category_params
    params.require(:sub_category).permit!
  end
end
