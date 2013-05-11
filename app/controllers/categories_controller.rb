class CategoriesController < ApplicationController

  def index
    @categories = Category.all

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new params[:category]
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: "#{@category.category_name} creada" }
      else
        format.html { render action: 'create' }
      end
    end
  end
end
