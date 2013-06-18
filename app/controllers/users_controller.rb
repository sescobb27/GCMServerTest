class UsersController < ApplicationController
  # when the request is POST and it was send as JSON skip athenticity token validation
  skip_before_filter :verify_authenticity_token,
                     if: Proc.new { |_user| _user.request.format == 'application/json' }
  respond_to :html, :json
  def add_entity
    @device = verify_existence
    if @device
      @user = User.where(gcm_device_id: @device.id).first
      @likes = User.to_str_arr params[:user][:likes].to_s
      @user.add_entities @likes
    end
  end

  def new
    @user = User.new
  end

  def create
    @device = Gcm::Device.where(registration_id: params[:user][:regId]).first_or_create
    @user = User.add_to_database params[:user], @device
    if @user.save
      respond_with(@user, location: users_path)
    else
      respond_with(@user, notice: @user.errors)
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

  end

  def recommended_coupons
    @user = User.find params[:id]

  end

  private
  def verify_existence
    Gcm::Device.where(registration_id: params[:user][:regId]).first
  end
end
