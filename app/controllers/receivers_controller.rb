class ReceiversController < ApplicationController
  # when the request is POST and it was send as JSON skip athenticity token validation
  skip_before_filter :verify_authenticity_token,
  if: Proc.new { |_user| _user.request.format == 'application/json' }

  # POST /receivers
  # POST /receivers.json
  def create
    puts "Params ->"+params.to_s
    device = Receiver.exist? params["regId"]
    unless device
      Receiver.add_to_database params
    end
    render :nothing => true
  end

  # PUT /receivers/1
  # PUT /receivers/1.json
  def update
    device = Receiver.exist? params["regId"]
    if device
      device.update_attributes registration_id: params["newregId"]
      render :nothing => true
    else
      render :text => "No device with this resgistration_id"
    end
  end

  # DELETE /receivers/1
  # DELETE /receivers/1.json
  def destroy
    gcm_device = Receiver.exist? params["regId"]
    if gcm_device
      Receiver.where(gcm_device_id: gcm_device.id).first.delete
      Gcm::Device.delete(gcm_device.id)
      render :nothing => true
    else
      render :text => "No device with this resgistration_id"
    end
  end
end
