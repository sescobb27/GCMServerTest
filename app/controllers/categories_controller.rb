class CategoriesController < ApplicationController

  def index
    @categories = Category.all


    respond_to do |format|
      format.html { render  action: :index, locals: { type: nil }}
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
        format.html { render action: 'new' }
      end
    end
  end
end
