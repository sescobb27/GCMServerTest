class EntitiesController < ApplicationController

  def new
    @entity = Entity.new
  end

  def create
    @parsed = JSON.parse params[:entity].delete :categories
		@entity = Entity.new params[:entity]
    respond_to do |format|
      begin
        validates_categories @parsed
        if @entity.add_categories @parsed
          format.html { redirect_to categories_path, notice: 'You are Awesome for join us' }
        else
          render_new_with_errors(format)
        end
      rescue Exception => e
        @entity.errors << e.message
        render_new_with_errors(format)
      end
    end
  end

  private
  def validates_categories(categories)
    raise 'You must select at least one category for your company' if categories.empty?
  end

  def render_new_with_errors(format)
    format.html { render :new, notice: @entity.errors }
  end

end
