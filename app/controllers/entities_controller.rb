class EntitiesController < ApplicationController
  respond_to :html
  respond_to :json, only: :index
  def new
    @entity = Entity.new
  end

  # create new company entity by request parameters, and parse the json array
  # containing its categories
  def create
    if params[:entity][:categories]
      @parsed = JSON.parse params[:entity].delete :categories
    else
      render status: 406, text: 'Choose categories'
      return
    end
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

  def index
    @entities = Entity.select(:entity_name).all
    respond_with @entities
  end

  private
  # verifies if categories array is empty, if it's raise and exception
  def validates_categories(categories)
    raise 'You must select at least one category for your company' if categories.empty?
  end

  def render_new_with_errors
    respond_with(@entity, notice: @entity.errors)
  end

end
