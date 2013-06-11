class CategoriesController < ApplicationController
  respond_to :html

  def index
    @categories = Category.all
    respond_with(:index, locals: { type: nil })
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new params[:category]
    if @category.save
      respond_with do |format|
        format.html { redirect_to categories_path, notice: "#{@category.category_name} creada" }
      end
    else
      respond_with(@category, notice: @category.errors)
    end
  end
end
