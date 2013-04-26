class CouponsController < ApplicationController
	# when the request is POST and it was send as JSON skip athenticity token validation
	skip_before_filter :verify_authenticity_token,
	if: Proc.new { |_user| _user.request.format == 'application/json' }
	# POST /coupons
 	# POST /coupons.json
	def create
		@coupon = Coupon.new params[:coupon]
		respond_to do |format|
			if @coupon.save
				format.html {  }
				format.json { render nothing: true }
			else
				format.json { render json: @coupon.errors, status: :unprocessable_entity }
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
end
