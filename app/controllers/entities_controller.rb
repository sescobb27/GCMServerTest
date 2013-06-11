class EntitiesController < ApplicationController
  respond_to :html

  def new
    @entity = Entity.new
  end

  def create
    @parsed = JSON.parse params[:entity].delete :categories
		@entity = Entity.new params[:entity]
    begin
      validates_categories @parsed
      if @entity.add_categories @parsed
        respond_with do |format|
          format.html{ redirect_to entity_coupons_path(@entity), notice: 'You are Awesome for join us' }
        end
      else
        render_new_with_errors
      end
    rescue Exception => e
      @entity.errors << e.message
      render_new_with_errors
    end
  end

  private
  def validates_categories(categories)
    raise 'You must select at least one category for your company' if categories.empty?
  end

  def render_new_with_errors
    respond_with(@entity, notice: @entity.errors)
  end

end
