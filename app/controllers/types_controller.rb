class TypesController < ApplicationController

  respond_to :html
  def index
    @types = Type.only_names.map do |type|
      type.type_name
    end
    respond_with(@types) do |format|
      format.html { render partial: 'show', layout: false }
    end
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new params[:type]
    if @type.save
      respond_with do |format|
        format.html{ redirect_to types_path, notice: 'New type was created' }
      end
    else
      respond_with(@type)
    end
  end

  def category_by_type
    @categories = Type.where('type_name = ?',params[:type])
                      .select('category_name, category_description')
                      .joins :categories
    respond_with(@categories) do |format|
      format.html { render partial: 'categories/categories',
                           locals: { type: params[:type] },
                           layout: false
      }
    end
  end
end
