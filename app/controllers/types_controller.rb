class TypesController < ApplicationController

  def index
    @types = Type.only_names.map do |type|
      type.type_name
    end
    respond_to do |format|
      format.html { render partial: 'show', layout: false, locals: { :@types => @types } }
      format.js { }
    end
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new params[:type]
    respond_to do |format|
      if @type.save
        format.html { redirect_to types_path, notice: 'New type was created' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def category_by_type
    @categories = Type.where('type_name = ?',params[:type])
                      .select('category_name, category_description')
                      .joins :categories
    respond_to do |format|
      format.html { render partial: 'categories/categories',
                           locals: { :@categories => @categories, type: params[:type] },
                           layout: false
      }
    end
  end
end
