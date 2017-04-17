class ApiController < ApplicationController
  layout false
  respond_to :json
  before_action :set_device

  def get_data
    render json: @device.data
  end

  def set_data
    @device.update!(data: params[:value])
    render json: @device.data
  end

  private

  def set_device
    @device = Device.find_by(secret: params[:secret])
    render json: "Device Not Found" unless @device
  end
end
