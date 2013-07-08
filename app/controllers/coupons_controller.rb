class CouponsController < ApplicationController
	# when the request is POST and it was send as JSON skip athenticity token validation
	#skip_before_filter :verify_authenticity_token,
	#if: Proc.new { |_user| _user.request.format == 'application/json' }
  before_filter :load_entity, except: [:index, :by_place, :by_likes, :by_random]
  before_filter :auth_user, only: [:index, :by_place, :by_likes, :by_random]
  respond_to :html
  respond_to :json, only: :index
  def index
    user_id = params[:user_id]
    if user_id
      #Entity.joins(:users).where(users: { id: user_id })
      @coupons = Coupon.joins(entity: :users).where(coupon_state: true, users: { id: user_id } ).random(5)
      respond_with @coupons do |format|
        format.html { render layout: false}
      end
    else
      load_entity
      @coupons = @entity.coupons
    end
  end


  def by_place
    @coupons = Coupon.joins(entity: :location).where(coupon_state: true, location: { name: params[:location] })
  end

  def by_likes

  end

  def by_random

  end

  def new
    @coupon = @entity.coupons.new
  end

  # POST /coupons
 	# POST /coupons.json
	def create
		@coupon = @entity.coupons.new params[:coupon]
    if @coupon.save
      respond_with do |format|
        format.html{ redirect_to entity_coupons_path(@entity), notice: 'Your new coupon was created successfully' }
      end
    else
      respond_with(@coupon, notice: @coupon.errors)
    end
	end

	def show
=begin
		devices = Gcm::Device.find(5)
		notification = Gcm::Notification.new
		notification.device = devices
		notification.collapse_key = "New Coupon"
		notification.delay_while_idle = true
		@coupon = Coupon.select("coupon_msg,coupon_name").find(1)
		notification.data = {:registration_ids => [devices.registration_id], :data => @coupon.to_h}
		notification.save
		Gcm::Notification.send_notifications
		render nothing: true
=end
  end
  
  private
    def load_entity
      #@entity = Entity.joins(:coupons).find(params[:entity_id])
      @entity = Entity.find params[:entity_id]
    end

end
