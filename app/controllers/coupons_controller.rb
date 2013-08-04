class CouponsController < ApplicationController
  # cuando el request es POST y es enviado vía JSON desde el celular evita la validación
  # del token de autenticidad
	#skip_before_filter :verify_authenticity_token,
	#if: Proc.new { |_user| _user.request.format == 'application/json' }
  before_filter :load_entity, except: [:index, :by_place, :by_likes, :by_random]
  before_filter :auth_user, only: [:index, :by_place, :by_likes, :by_random]
  respond_to :html
  respond_to :json, only: :index

  # encuentra 5 cupones disponibles de manera aleatoria, directamente sobre los gustos de cada usuario
  def index
=begin QUERY
  coupons.entity_id == entity.id and
  entity.id == user_entity.entity_id and
  user_entity.user_id == user.id and
  coupons.coupon_state == true
  5 random entities
=end
    user_id = params[:user_id]
    if user_id
      @coupons = Coupon.joins(entity: :users).where(coupon_state: true, users: { id: user_id } ).random(5)
      respond_with @coupons do |format|
        format.html { render layout: false}
      end
    else
      load_entity
      @coupons = @entity.coupons
    end
  end

  # encuentra 5 cupones disponibles de manera aleatoria, de acuerdo a un lugar (:location)
  def by_place
=begin QUERY
    coupons.entity_id == entity.id and
    entity.id == entity_location.entity_id and
    entity_location.location_id == location.id and
    location.name == location_from_params and
    coupon.coupon_state = true
    5 random entities
=end
    @coupons = Coupon.joins(entity: :locations).where(coupon_state: true, locations: { name: params[:location] }).random(5)
  end

  # encuentra 5 cupones disponibles de manera aleatoria, teniendo en cuenta los
  # los gustos de cada usuario ( por categorías relacionadas a los negocios (:entities)
  # seleccionados )
  def by_likes

  end

  # encuentra 5 cupones disponibles de manera aleatoria
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
    # cuando estamos tratando sobre los negocios ( :entities ) y no sobre los usuarios,
    # necesitamos cargar previamente a cada acción el negocio sobre el cual
    # estamos trabajando
    def load_entity
      #@entity = Entity.joins(:coupons).find(params[:entity_id])
      @entity = Entity.find params[:entity_id]
    end

end
