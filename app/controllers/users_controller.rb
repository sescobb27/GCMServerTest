class UsersController < ApplicationController
  # cuando el request es POST y es enviado vía JSON desde el celular evita la validación
  # del token de autenticidad
  # skip_before_filter :verify_authenticity_token,
  #                    if: Proc.new { |_user| _user.request.format == 'application/json' }
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

  # los usuarios de la aplicación tienen que ser usuarios mobiles, cada
  # celular tiene un id asignado ya sea por Google, Apple o Windows Phone por lo
  # por lo que al recibir el request para crear un usuario en la app sera enviado
  # este id y trataremos de encontrarlo o crearlo en la base de datos de celulares
  # registrados, luego crearemos un usuario asociado, el request contendrá un campo
  # :entities que contiene los gustos de cada usuario por lo que sera parseado
  # y asignado a @parsed_entities ver parse_json()
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

  # intenta encontrar el celular con el id enviado a través del request, luego, si
  # existe sera destruido junto con su usuario asociado, de lo contrario sera enviado
  # un mensaje diciendo que el id a ser eliminado no existe
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
    respond_with @users
  end

  def show
    @user = User.find params[:id]
  end

  private
  # encuentra el celular con el (registration_id == id enviado), de lo contrario retorna nil
  def verify_existence
    Gcm::Device.where(registration_id: params[:user][:regId]).first
  end

  # cuando el request es un create o update contiene un campo con los gustos de cada
  # usuario en un campo llamado :entities, por lo que necesitamos parcearlos y asignarlos
  # a @parsed_entities para luego procesarlos
  def parse_json
    @parsed_entities = JSON.parse params[:user].delete :entities
  end
end
