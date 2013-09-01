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
          @categories = Category.where category_name: JSON.parse( params[:entity].delete :categories )
      else
          render status: 406, text: 'Choose categories'
          return
      end
      @entity = Entity.new params[:entity], categories: @categories
      if @entity.save
          # respond_with do |format|
          #   format.html{ redirect_to entity_coupons_path(@entity), notice: 'You are Awesome for join us' }
          # end
          flash[:notice] = 'You are Awesome for join us'
          respond_with @entity
      else
          # render_new_with_errors
          flash[:errors] = "#{@entity.errors}"
          respond_with @entity
      end
  end

  def index
    @entities = Entity.all
    respond_with @entities
  end

end
