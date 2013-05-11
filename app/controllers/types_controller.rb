class TypesController < ApplicationController

  def index
    @types = Type::VALID_TYPES.values
    respond_to do |format|
      format.html
      format.js
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
end
