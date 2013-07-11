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

  # the users of the app must have a mobile, which has a device id provided by
  # google apis so we try to find this device id or created one and then create
  # create an user, note: the request is parsed in :parse_json to extract users
  # likes
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

  # try to find the device with device id get it in request parameters,
  # then if it exist is destroyed otherwise is send a message telling the 
  # requested id was not found
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

  private
  def verify_existence
    Gcm::Device.where(registration_id: params[:user][:regId]).first
  end

  # when request is for create or update it contains users likes, which are
  # companies as entities so we need to parse them to create or update users
  # likes
  def parse_json
    @parsed_entities = JSON.parse params[:user].delete :entities
  end
end
