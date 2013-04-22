class ReceiversController < ApplicationController
  # when the request is POST and it was send as JSON skip athenticity token validation
  skip_before_filter :verify_authenticity_token,
  if: Proc.new { |_user| _user.request.format == 'application/json' }
  # GET /receivers
  # GET /receivers.json
  def index
    @receivers = Receiver.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @receivers }
    end
  end

  # GET /receivers/1
  # GET /receivers/1.json
  def show
    @receiver = Receiver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @receiver }
    end
  end

  # GET /receivers/new
  # GET /receivers/new.json
  def new
    @receiver = Receiver.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @receiver }
    end
  end

  # GET /receivers/1/edit
  def edit
    @receiver = Receiver.find(params[:id])
  end

  # POST /receivers
  # POST /receivers.json
  def create
    puts "Params ->"+params.to_s
    unless Receiver.exist? params["regId"]
      Receiver.add_to_database params
    end
    render :nothing => true
  end

  # PUT /receivers/1
  # PUT /receivers/1.json
  def update
    @receiver = Receiver.find(params[:id])

    respond_to do |format|
      if @receiver.update_attributes(params[:receiver])
        format.html { redirect_to @receiver, notice: 'Receiver was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @receiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receivers/1
  # DELETE /receivers/1.json
  def destroy
    gcm_device = Gcm::Device.where(registration_id: params["regId"])
    @receiver = Receiver.where gcm_device_id: gcm_device.id 
    @receiver.destroy
    gcm_device.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
