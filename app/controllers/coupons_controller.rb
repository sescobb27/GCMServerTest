class CouponsController < ApplicationController
	# when the request is POST and it was send as JSON skip athenticity token validation
	#skip_before_filter :verify_authenticity_token,
	#if: Proc.new { |_user| _user.request.format == 'application/json' }
  before_filter :load_entity
  def index
    @coupons = @entity.coupons
  end

  def new
    @coupon = @entity.coupons.new
  end

  # POST /coupons
 	# POST /coupons.json
	def create
		@coupon = @entity.coupons.new params[:coupon]
		respond_to do |format|
			if @coupon.save
				format.html { redirect_to entity_coupons_path @entity }
				#format.json { render nothing: true }
      else
        format.html { render :new, notice: @coupon.errors }
				#format.json { render json: @coupon.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
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
  end
  
  private
  def load_entity
    @entity = Entity.find params[:entity_id]
  end
end
