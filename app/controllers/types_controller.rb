class TypesController < ApplicationController

  # respond_to :html
  respond_to :json
  def index
    @types = Type.all
    # respond_with(@types) do |format|
    #   format.html { render partial: 'show', layout: false }
    # end
    respond_with @types
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new params[:type]
    if @type.save
      # respond_with do |format|
      #   format.html{ redirect_to types_path, notice: 'New type was created' }
      # end
      flash[:notice] =  'New type was created'
      respond_with @type
    else
      flash[:errors] = "#{@type.errors}"
      respond_with @type
    end
  end

  def category_by_type
    @categories = Type.where('type_name = ?',params[:type])
                      .select('category_name, category_description')
                      .joins :categories
    # respond_with(@categories) do |format|
    #   format.html { render partial: 'categories/categories',
    #                        locals: { type: params[:type] },
    #                        layout: false
    #   }
    # end
    respond_with @categories
  end
end
