class EntitiesController < ApplicationController

  def new
    @entity = Entity.new
  end

  def create
		@entity = Entity.new params[:entity]
    respond_to do |format|
      if @entity.save
        format.html { redirect_to categories_path, notice: "#{@entity.category_name} creada" }
      else
        format.html { render :new, notice: @entity.errors }
      end
    end
  end

end
