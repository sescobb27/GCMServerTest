class UsersController < ApplicationController
  # when the request is POST and it was send as JSON skip athenticity token validation
  skip_before_filter :verify_authenticity_token,
                     if: Proc.new { |_user| _user.request.format == 'application/json' }
  before_filter :parse_json, only:  [:create, :update]
  respond_to :html, :json
  def add_entity
=begin
    @device = verify_existence
    if @device
      @user = User.where(gcm_device_id: @device.id).first
    end
=end
  end

  def new
    @user = User.new
  end

  def create
    @device = Gcm::Device.where(registration_id: params[:user][:regId]).first_or_create
    @user = User.add_to_database params[:user], @device, @parsed_entities
    if @user.save
      respond_with do |format|
          format.html{ redirect_to user_path(@user) }
      end
    else
      respond_with(@user)
    end
  end

  def update
    @device = verify_existence
    if @device
      @device.update_attributes registration_id: params[:user][:regId]
      render :nothing => true
    else
      render :text => 'No device with this resgistration_id'
    end
  end

  def destroy
    @device = verify_existence
    if @device
      User.where(gcm_device_id: @device.id).first.destroy
      Gcm::Device.delete(@device.id)
      render :nothing => true
    else
      render :text => 'No device with this resgistration_id'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def recommended_coupons
    @user = User.find params[:id]

  end

  private
  def verify_existence
    Gcm::Device.where(registration_id: params[:user][:regId]).first
  end

  def parse_json
    @parsed_entities = JSON.parse params[:user].delete :entities
  end
end
